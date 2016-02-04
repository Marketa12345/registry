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


