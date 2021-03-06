class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { leng: I18n.locale }
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:leng])  ? params[:leng] : I18n.default_locale
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "Hello #{resource.name}"
    if resource.admin?
      admin_tests_path
    else
      super
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
