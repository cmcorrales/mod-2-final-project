class SessionsController < ApplicationController
  before_action :check_session, except:[:login, :new]
  def new

  end

  def login
    user = User.find_by(user_name:params[:session][:user_name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to :index
    else
      flash.now[:danger] = "Invalid user name or password"
      render 'new'
    end
  end


  def logout
    #byebug
    session[:user_id] = nil
    redirect_to :login
  end

end
