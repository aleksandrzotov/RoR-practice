class RecoveryPasswordMailer < ApplicationMailer
  def new_recovery_password_email
    email = params[:email]
    @user_id = params[:user_id]
    puts('--------', email, @user_id)
    mail(to: email, subject: "recovery")
  end
end
