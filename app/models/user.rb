class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :email,
            :nick_name,
            :first_name,
            :family_name,
            :first_name_kana,
            :family_name_kana,
            :occupation,
            :address,
            :encrypted_password,
            :generation,
            :sex,
            presence: true

  has_many :posts, dependent: :destroy
  has_many :post_assessments, dependent: :destroy
  has_many :post_negative_assessments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comment_assessments, dependent: :destroy
  has_many :comment_negative_assessments, dependent: :destroy




  enum occupation: { "職業を選択してください":0, 会社員: 1, 経営者: 2, 自営業: 3, フリーター: 4, 学生: 5, その他: 6 }
  enum generation: { "年代を選択してください":0, '10代': 1, '20代': 2, '30代': 3, '40代': 4, '50代': 5, '60代': 6, '70歳以上': 7 }
  enum sex: { "性別を選択してください":0, 男性: 1, 女性: 2 }
  enum address: {
     "都道府県を選択してください":0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
     沖縄県:47
  }

  # profile_image用
  attachment :profile_image

  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.nick_name = "no name"
      user.first_name = "no name"
      user.family_name = "no name"
      user.first_name_kana = "no name"
      user.family_name_kana = "no name"
      user.occupation = 1
      user.address = 1
      user.phone_number = "no number"
      user.generation = 1
      user.sex = 1
    end
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end