class UsersController < ApplicationController
  

def index
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