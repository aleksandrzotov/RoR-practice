class UsersController < ApplicationController

    def edit
      @user = User.find(params[:id])
      @token = params[:token]
    end

    def index
    end

    def show
      @user = User.includes(:posts).find(params[:id])
    end

    def new
      @user = User.new
    end

  def create
    @user = User.new(user_params)

    @user.email.downcase!

    @user.save
    redirect_to root_path
  end

  def update
    user = User.find(params[:id])
    if params[:token] == user.reset_password_token && user.reset_password_sent_at > Time.now - 12.hours
      result = user.update(password: params[:password])
      if !result
        flash.notice = "can not update password"
      end
      redirect_to root_path
    else
      flash.notice = "token invalid"
      redirect_to :recovery_password
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
