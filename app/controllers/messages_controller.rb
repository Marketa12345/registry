class MessagesController < ApplicationController


	before_action :set_message, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!


def my_messages

  @contacts = Contact.where(contacts: {sender_id: current_user.id})
  #@contacts = Contact.where(contacts: {sender_id: current_user.id, recipient_id: @subject.user_id})
 
  @messages = Message.all


 


end


 def set_message
      @message = Message.find(params[:id])
    end

end
