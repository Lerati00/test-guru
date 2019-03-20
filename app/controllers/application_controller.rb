class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception 

  before_action :set_locale

  def default_url_options 
    I18n.locale == I18n.default_locale ? {  } : { lang: I18n.locale }
  end
  
  protected 

  def after_sign_in_path_for(user)
    flash[:notice] = t('hello', name: user.first_name)
    user.admin? ? admin_tests_path : root_path
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end
