class CommentNegativeAssessment < ApplicationRecord
  
  belongs_to :comment
  
  def comment_negative_assessment_by?(user, comment)
    comment_negative_assessments.where(user_id: user.id, comment_id: comment.id).exists?
  end
end
