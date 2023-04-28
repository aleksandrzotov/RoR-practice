class Api::V1::PostsController < Api::ApplicationController
  protect_from_forgery with: :null_session
  before_action :authorize_request

  def index
    @posts = Post.all
    render json: @posts, status: :ok
  end

  def show
    render json: @post, status: :ok
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: { errors: @post.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    unless @post.update(post_params)
      render json: { errors: @post.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end
end
