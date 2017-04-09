class NilClass
  def split(*)
    []
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionHelper

  before_action :authenticate, except: [:new, :create, :signup, :create_user]

  def current_user
    session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  def authenticate
    puts "Current user is #{current_user}, id is #{session[:current_user_id]}"
    unless current_user
      redirect_to signin_path
    end
  end

  before_action :set_locale

  def set_locale
    I18n.locale = browser_locales.first || I18n.default_locale
  end

  def browser_locales
    request.env['HTTP_ACCEPT_LANGUAGE'].split(/;|,/).reject do |x|
      x.start_with?('q')
    end & I18n.available_locales.map(&:to_s)
  end
end
