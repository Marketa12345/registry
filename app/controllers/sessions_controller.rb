
class SessionsController < ApplicationController
	def create
		user = User.from_omniauth(env["omniauth.auth"])
		#session[:user_id] = user.id
		#debugge"
		session[:user_id] = user.id#
		##sign_in_and_redirect user if user 
		#redirect_to root_url, :notice => "Signed in!"
		redirect_to root_url#
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

