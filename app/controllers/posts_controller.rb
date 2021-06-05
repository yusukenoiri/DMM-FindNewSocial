class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

      respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Cooment was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        # 追加
        format.js { @status = "success" }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        # 追加
        format.js { @status = "fail" }
      end
    end
  end

  def destory
  end

  def show
    @post = Post.find(params[:id])
    @commens = @post.comments
  end

  def post_params
    params.require(:post).permit(:title, :body, :genre_id, :user_id)
  end

end
