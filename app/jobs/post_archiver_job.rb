class PostArchiverJob < ApplicationJob
  def perform
    posts = Post.where(['created_at < ?', 30.days.ago]).where(is_archived: false)
    posts.each {|post| post.update(is_archived: true)}
  end
end
