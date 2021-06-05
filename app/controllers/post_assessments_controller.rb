class PostAssessmentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.post_assessments.new(post_id: post.id)
    favorite.save
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.post_assessments.find_by(post_id: post.id)
    favorite.destroy
    redirect_to posts_path
  end

end
