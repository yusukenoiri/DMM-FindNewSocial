class Comment < ApplicationRecord

  belongs_to :post
  belongs_to :user
  has_many :comment_assessments, dependent: :destroy
  has_many :comment_negative_assessments, dependent: :destroy

  validates :body, presence: true

  def comment_favorited_by?(user)
    comment_assessments.where(user_id: user.id).exists?
  end

  def comment_negative_assessment_by?(user)
    comment_negative_assessments.where(user_id: user.id).exists?
  end

end
