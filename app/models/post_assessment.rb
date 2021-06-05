class PostAssessment < ApplicationRecord
  belongs_to :post

  def favorited_by?(user)
    post_assessments.where(user_id: user.id).exists?
  end
end
