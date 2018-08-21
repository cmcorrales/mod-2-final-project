class ApplicationController < ActionController::Base
  #before_filter :check_session, except: [:index, :login, :signup]
  protect_from_forgery with: :exception
  include SessionsHelper

  def check_session
    if session[:user_id]
      return true
    else
      return false
    end
  end
end
