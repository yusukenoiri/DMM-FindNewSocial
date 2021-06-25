class CommentNegativeAssessmentsController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    @post = Post.find(params[:post_id])
    favorite = current_user.comment_negative_assessments.new(comment_id: @comment.id)
    favorite.save
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @post = Post.find(params[:post_id])
    favorite = current_user.comment_negative_assessments.find_by(comment_id: @comment.id)
    favorite.destroy
  end

end
