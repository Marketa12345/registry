class Image < ActiveRecord::Base


	belongs_to :subject
	mount_uploader :image, ImageUploader
end
