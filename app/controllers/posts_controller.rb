class PostsController < ApplicationController

    def new
    end

    def create
        Post.create(
            text: params[:posts][:text],
            user: current_user)
        redirect_to current_user
    end

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def destroy
        Post.delete(params[:id])
        redirect_to current_user
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(text: params[:post][:text])
        redirect_to current_user
    end
end
