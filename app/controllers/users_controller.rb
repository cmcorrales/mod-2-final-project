class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :user_name, :password, :confirmation)
    end
end
