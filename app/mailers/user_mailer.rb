class UserMailer < ApplicationMailer

	  default from: 'info@railsformers.com'
 
  def update_info_email(user, subject)
    @user = user
    @subject = subject
    mail(to: @user.email, subject: 'Změna u předmětu na stránce registr nájmů')
  end


  def contact_send_email(sender, recipient, contact)

  	@sender = sender
  	@recipient = recipient
    @contact = contact

  	mail( from: @sender.email, to: @recipient.email, subject: 'Nová zpráva zaslaná prostřednictvím www.registrnajmu.cz' )
  end

end


