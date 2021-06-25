class CommentAssessment < ApplicationRecord

  belongs_to :comment

  def comment_favorited_by?(user, comment)
    comment_assessments.where(user_id: user.id, comment_id: comment.id).exists?
  end

end