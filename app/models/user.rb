class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :subjects
	has_one :profile
  has_many :contacts
  has_many :messages
  validates :role, presence: true

  after_create :build_profile

before_validation :set_role


def set_role 

  self.role = "tenant" if self.role.blank?
end

#def self.from_omniauth(auth)
#  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
#    user.provider = auth.provider
#    user.uid = auth.uid
#    user.name = auth.info.name
#    user.oauth_token = auth.credentials.token
#    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
#    user.save!
#  end
#end



  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.email = auth.info.email 
      user.password = Devise.friendly_token[0,20]
      user.save!
    end
  end











  def build_profile
    Profile.create(user: self) 
  end

  def name 
    profile.name rescue ''
  end


def is_landlord?
	role == "landlord"
end

def is_tenant?
	role == "tenant"
end



end


