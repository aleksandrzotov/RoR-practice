class ReactionsController < ApplicationController
  def create
    if !current_user
      flash.notice = "not permited"
      redirect_to root_path
    else
      @kind = params[:kind]
      @post = Post.find(params[:post_id])
      Reaction.create(kind: params[:kind], post: @post, user: current_user)
      @post.reload
    end
  end
end
