class PostsController < ApplicationController

  before_action :authenticate_user!, except: [ :index]

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
    @favorites = Post.find_by(id: PostAssessment.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))

    if user_signed_in?
     @user = User.find(current_user.id)
    end
    

  end

  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @post.generation = current_user.generation

      respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Cooment was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        format.js { @status = "success" }
        flash[:notice] = "Post was successfully created."
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = "Post was successfully destroyed."
      redirect_to posts_path
    else
      render "index"
    end
  end

  def search
    respond_to do |format|
      format.html
      format.json
      # json形式で値を返し、jbundlerファイルを使用できるようになる
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all.order(created_at: :desc)
    @comments = @post.comments
    @favorites = Post.find_by(id: PostAssessment.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
    @user = User.find(current_user.id)
  end

  def post_params
    params.require(:post).permit(:title, :body, :genre_id, :user_id)
  end

end
