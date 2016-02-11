
class SessionsController < ApplicationController
	def create
		user = User.from_omniauth(env["omniauth.auth"])
		#session[:user_id] = user.id
		#debugge"
		sign_in_and_redirect user if user 
		#redirect_to root_url, :notice => "Signed in!"
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end

	private
	def userparams
		params.require(:user).permit(:provider, :uid, :name, :oauth_token, :oauth_expires_at )
	end
end

