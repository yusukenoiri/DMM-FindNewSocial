class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :posts, dependent: :destroy
  has_many :post_assessments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comment_assessments, dependent: :destroy

  enum occupation: { 会社員: 0, 経営者: 1, 自営業: 2, フリーター: 3, 学生: 4, その他: 5}

  attachment :profile_image

  # Facebook Settings
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end