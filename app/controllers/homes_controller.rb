class HomesController < ApplicationController

  def top
    @favorites = Post.find_by(id: PostAssessment.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
  end

  def about
  end

end
