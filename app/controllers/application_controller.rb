class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    user_images_path(user)
  end

  def after_sign_out_path_for(users)
    new_user_session_path
  end

 protected

 def configure_permitted_parameters
   added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :avatar]
   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
 end
end
