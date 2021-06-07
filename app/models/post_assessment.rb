class PostAssessment < ApplicationRecord
  belongs_to :post

  def post_favorited_by?(user)
    post_assessments.where(user_id: user.id).exists?
  end
end
