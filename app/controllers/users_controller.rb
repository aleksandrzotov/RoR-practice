class UsersController < ApplicationController

    def edit
      token = params[:token]
      @user_id = params[:id]
      user = User.find(@user_id)

      @is_valid_token = token == user.reset_password_token && user.reset_password_sent_at > Time.now - 12 * 60 * 60
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

    if @user.save
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
    else
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end

  def update
    user = User.find(params[:id])
    user.update(password: params[:password])
    redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
