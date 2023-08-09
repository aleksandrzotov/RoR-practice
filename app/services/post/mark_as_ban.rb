class Post::MarkAsBan < Command
  def initialize(post)
    @post = post
  end

  def perform
    @post.update!(is_banned: true)
    success
  end
end
