class CommentAssessmentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.post_assessments.new(post_id: post.id)
    favorite.save
    redirect_to post_assessments_path(post)
  end

  def destroy
    post = Post.find(params[:post_image_id])
    favorite = current_user.post_assessments.find_by(post_id: post.id)
    favorite.destroy
    redirect_to post_assessments_path(post)
  end

end
