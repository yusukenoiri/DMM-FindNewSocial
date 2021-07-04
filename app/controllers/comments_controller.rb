class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.score = Language.get_data(comment_params[:body])  #natural language score用
    @comment.user_id = current_user.id
    @comment.post_id = @post.id

      respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js { @status = "success" }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      flash[:notice] = "Comment was successfully destroyed."
      redirect_to post_path(comment.post_id)
    else
      render template: "posts/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id,:post_id,:body)
  end

end
