class ApplicationController < ActionController::Base
  before_action :setlocale
  include SessionsHelper

  private

  def setlocale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "users.edit.login_request"
    redirect_to login_url
  end
end
