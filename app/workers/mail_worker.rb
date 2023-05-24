class MailWorker
  include Sidekiq::Worker

  def perform(a)
    puts('hanle job', a)
  end
end
