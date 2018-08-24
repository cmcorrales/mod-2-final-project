class UsersController < ApplicationController
  before_action :check_session, except:[:new, :create]
  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      log_in @user
      redirect_to @user
    else
      @cur_model = @user
      render :new
    end
  end

  private
    def user_params
      param  = params.require(:user).permit(:name, :user_name, :password, :confirmation)
      param["user_type"] = "S"
      param
    end
end
