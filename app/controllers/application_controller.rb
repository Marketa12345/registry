
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :role) }
end

end
#
#class ApplicationController < ActionController::Base

#  protected

#  def devise_parameter_sanitizer
#    if resource_class == User
#      User::ParameterSanitizer.new(User, :user, params)
#    else
#      super # Use the default one
#    end
#  end
#end