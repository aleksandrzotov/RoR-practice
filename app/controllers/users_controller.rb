class UsersController < ApplicationController

    def create
    end

    def edit
    end

    def index
    end

    def show
      @user = User.includes(:posts).find(params[:id])
    end
end
