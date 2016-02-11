class UsersController < ApplicationController
  



def index
end



    def change_role 
        #debugger
        if current_user.is_landlord?

            current_user.role = "tenant"

        else
            current_user.role = "landlord"
      end
      current_user.save

      redirect_to root_path
    end



def new

	   @user = User.new
end

def create
    @user = User.new(user_params)

   @user.save
       
    
end

def update
@user.update
end

def edit
end


def show
end

def destroy
end 


end