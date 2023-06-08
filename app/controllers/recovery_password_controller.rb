class RecoveryPasswordController < ApplicationController
    def new
    end

    def create
        email = params[:recovery_password][:email]
        user = User.find_by(email: email)
        token = SecureRandom.hex(10)
        user.update(reset_password_token: token, reset_password_sent_at: Time.now)

        MailWorker.perform_async(email, user.id, token)
        redirect_to root_path
    end

    def index
    end
end
