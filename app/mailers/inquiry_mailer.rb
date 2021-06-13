class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@example.com',
      to: 'yusuke.noiri@gmail.com',
      # to:   ENV['INQUIRY_EMAIL_ADDRESS'],
      subject: 'お問い合わせ通知'
    )
  end
end
