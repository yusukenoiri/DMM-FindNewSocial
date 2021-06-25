class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  # newアクションから入力内容を受け取り、
  # 送信ボタンを押されたらcreateアクションを実行
  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.invalid?
      render :new
    end
  end

  # 入力内容に誤りがあった場合、入力内容を保持したまま前のページに戻る
  # backアクションで定義
  def back
    @inquiry = Inquiry.new(inquiry_params)
    render :new
  end

  # 実際に送信するアクション
  # ここで初めて入力内容を
  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def inquiry_params
    params.require(:inquiry)
          .permit(:email,
                  :name,
                  :phone_number,
                  :subject,
                  :message
                 )
  end
end