class Contact < ActiveRecord::Base
	belongs_to :sender, class_name: "User"

	belongs_to :recipient, class_name: "User"



	after_create :send_mail




	def send_mail
		UserMailer.contact_send_email(self.sender, self.recipient, self).deliver_now

	end


end
