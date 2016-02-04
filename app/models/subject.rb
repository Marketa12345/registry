class Subject < ActiveRecord::Base

#attr_accessible :image, :remote_image_url
mount_uploader :image, ImageUploader
self.inheritance_column = nil
has_many :images, dependent: :destroy
has_many :contracts
has_many :contacts
has_many :watches

after_update :send_info

def send_info           
	self.watches.each do |w|
    	UserMailer.update_info_email(w.user, self).deliver_now  
	end
end



 #has_many :post_attachments
 #accepts_nested_attributes_for :post_attachments, :images
 accepts_nested_attributes_for :images

 def user_params
      params.require(:subject).permit(:image, :remote_image_url)
    end


def self.search(search)
  if search
    self.where("name like ?", "%#{search}%")
  else
    self.all
  end
end


end
