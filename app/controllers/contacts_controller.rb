class ContactsController < ApplicationController



  def new
    @subject = Subject.find(params[:subject_id])
    @contact = @subject.contacts.new
  end



  def create
    @subject = Subject.find(params[:subject_id])
    @contact = @subject.contacts.new(contact_params)

    @contact.sender_id = current_user.id
    @contact.recipient_id = @subject.user_id

    if @contact.save

      redirect_to root_path

    else 
      render "new"

    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:subject, :content)
    end
end
