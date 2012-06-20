class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  helper_method :current_user
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def current_user
    @current_user = User.find_by_id( session[:user_id] )
  end

  def login?
    return current_user ? true : false
  end

end
