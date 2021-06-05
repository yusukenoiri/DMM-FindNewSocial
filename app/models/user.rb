class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :post_assessments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comment_assessments, dependent: :destroy

  enum occupation: { 会社員: 0, 経営者: 1, 自営業: 2, フリーター: 3, 学生: 4, その他: 5}

  attachment :profile_image

end