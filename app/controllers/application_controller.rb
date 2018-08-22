class ApplicationController < ActionController::Base
  before_action :check_session

  protect_from_forgery with: :exception
  include SessionsHelper

  def check_session
    if !session[:user_id]
      redirect_to :login
    end
  end
end
