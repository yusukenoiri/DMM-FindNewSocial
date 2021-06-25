class PostNegativeAssessment < ApplicationRecord

  belongs_to :post

  def post_negative_assessment_by?(user)
    post_negative_assessments.where(user_id: user.id).exists?
  end

end
