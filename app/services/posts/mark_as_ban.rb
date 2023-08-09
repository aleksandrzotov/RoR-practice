class Posts::MarkAsBan < Command
  REPORTS_COUNT = 5
  def perform
    ids = Reaction.where(kind: 'report').group_by(&:post_id).filter { |k, v| v.count > REPORTS_COUNT }.keys
    Post.where(id: ids).each {|post| Post::MarkAsBan.new(post).perform}
    success
  end
end
