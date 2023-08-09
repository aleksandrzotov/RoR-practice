class PostToBanJob < ApplicationJob
  def perform
    Posts::MarkAsBan.perform
  end
end
