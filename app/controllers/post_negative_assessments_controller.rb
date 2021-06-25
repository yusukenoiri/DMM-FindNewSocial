class PostNegativeAssessmentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.post_negative_assessments.new(post_id: @post.id)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.post_negative_assessments.find_by(post_id: @post.id)
    favorite.destroy
  end
  
end
