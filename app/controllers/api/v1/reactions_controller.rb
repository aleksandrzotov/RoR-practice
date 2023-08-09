class Api::V1::ReactionsController < Api::ApplicationController
  protect_from_forgery with: :null_session
  before_action :authorize_request

  def create
    @kind = params[:kind]
    @post = Post.find(params[:post_id])
    result = Reaction.create(kind: params[:kind], post: @post, user: @current_user)
    puts result
    if result
      render json: {status: :created}
    else
      render json: { errors: result.errors.full_messages },
        status: :unprocessable_entity
    end
  end
end
