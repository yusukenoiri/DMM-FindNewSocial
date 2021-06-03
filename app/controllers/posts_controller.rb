class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destory
  end

  def show
  end

  def post_params
    params.require(:post).permit(:title, :body, :genre_id, :user_id)
  end

end
