class LeasableController < ApplicationController





 def index

	if user_signed_in?
      @subjects = current_user.subjects.where(leasable:true)
    else
      @subjects = Subject.where(leasable:true).where(is_public2:true)
    end  

end

def all
	@subjects = Subject.where(leasable:true).where(is_public2:true)
end


end
