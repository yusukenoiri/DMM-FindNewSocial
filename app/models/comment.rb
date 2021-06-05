class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :comment_assessments, dependent: :destroy

  def favorited_by?(user)
    comment_assessments.where(user_id: user.id).exists?
  end

end
