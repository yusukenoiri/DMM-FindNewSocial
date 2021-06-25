class Genre < ApplicationRecord
  
  has_many :posts, dependent: :destroy
  enum genre: { 公共交通: 0, インフラ: 1, ヘルスケア: 2, 生活: 3, 地域: 4, その他: 5}
  
end
