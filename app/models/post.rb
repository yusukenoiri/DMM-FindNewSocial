class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :post_assessments, dependent: :destroy
  has_many :comment_assessments, dependent: :destroy

  def post_favorited_by?(user)
    post_assessments.where(user_id: user.id).exists?
  end

  def comment_favorited_by?(user, post)
    comment_assessments.where(user_id: user.id, post_id: post.id).exists?
  end

end