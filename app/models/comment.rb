class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :comment_assessments, dependent: :destroy

  def comment_favorited_by?(user, post)
    comment_assessments.where(user_id: user.id, post_id: post.id).exists?
  end

end
