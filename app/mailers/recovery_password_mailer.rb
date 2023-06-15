class RecoveryPasswordMailer < ApplicationMailer
  def new_recovery_password_email
    email = params[:email]
    @user_id = params[:user_id]
    @token = params[:token]
    mail(to: email, subject: "recovery")
  end
end
