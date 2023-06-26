class ReactionsController < ApplicationController
  def create
    puts('-----------', params)
    @kind = params[:kind]
    @post = Post.find(params[:post_id])
    Reaction.create(kind: params[:kind], post: @post, user: current_user)
    @post.reload
  end
end
