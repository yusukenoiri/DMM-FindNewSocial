class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :post_assessments, dependent: :destroy

  def favorited_by?(user)
    post_assessments.where(user_id: user.id).exists?
  end

end