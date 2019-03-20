class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception 
  
  protected 

  def after_sign_in_path_for(user)
    flash[:notice] = "Hello, #{user.first_name}"
    user.is_a?(Admin) ? admin_tests_path : root_path
  end

  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation, :last_name)
  end

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_account_update_params
  #  devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  #end

end
