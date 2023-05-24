class MailWorker
  include Sidekiq::Worker

  def perform(email, user_id)
    puts('hanle job', email, user_id)
    RecoveryPasswordMailer.with(email: email, user_id: user_id).new_recovery_password_email.deliver_later
  end
end
