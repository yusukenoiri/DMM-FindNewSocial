class CommentAssessment < ApplicationRecord
  belongs_to :comment

  def comment_favorited_by?(user, post)
    comment_assessments.where(user_id: user.id, post_id: post.id).exists?
  end
  
end