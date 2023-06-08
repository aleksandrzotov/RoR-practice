class MailWorker
  include Sidekiq::Worker

  def perform(email, user_id, token)
    RecoveryPasswordMailer.with(email: email, user_id: user_id, token: token).new_recovery_password_email.deliver_later
  end
end
