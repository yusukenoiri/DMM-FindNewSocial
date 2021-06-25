class Post < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :post_assessments, dependent: :destroy
  has_many :post_negative_assessments, dependent: :destroy

  enum genre_id: { 公共交通: 0, インフラ: 1, ヘルスケア: 2, 生活: 3, 地域: 4, その他: 5}
  enum generation: { "年代を選択してください":0, '10代': 1, '20代': 2, '30代': 3, '40代': 4, '50代': 5, '60代': 6, '70歳以上': 7 }

  validates :title,
      :body,
      :genre_id,
      presence: true

  def post_favorited_by?(user)
    post_assessments.where(user_id: user.id).exists?
  end

  def post_negative_assessment_by?(user)
    post_negative_assessments.where(user_id: user.id).exists?
  end

  def comment_favorited_by?(user, comment)
    comment_assessments.where(user_id: user.id, comment_id: comment.id).exists?
  end

  def comment__negative_assessment_by?(user, comment)
    comment_negative_assessments.where(user_id: user.id, comment_id: comment.id).exists?
  end

end