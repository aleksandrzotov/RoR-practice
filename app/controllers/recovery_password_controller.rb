class RecoveryPasswordController < ApplicationController
    def new
    end

    def create
        email = params[:recovery_password][:email]
        user = User.find_by(email: email)
        MailWorker.perform_async(email, user.id)
        redirect_to root_path
    end

    def index
    end
end
