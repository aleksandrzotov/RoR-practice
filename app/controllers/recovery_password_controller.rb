class RecoveryPasswordController < ApplicationController
    def new
    end

    def create
        MailWorker.perform_async(params[:recovery_password][:email])
        redirect_to root_path
    end

    def index
    end
end
