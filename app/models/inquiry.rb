class Inquiry < ApplicationRecord
  
    enum subject: { "用件を選択してください":0, 使用方法: 1, 改善要望: 2, お礼: 3, その他: 4 }
    validates :name,
          :message,
          :phone_number,
          :email,
          :subject,
          presence: true
          
end
