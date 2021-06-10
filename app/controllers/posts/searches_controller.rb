class Posts::SearchesController < ApplicationController
  def index
    # binding.pry
    @posts = Post.where('title LIKE(?)', "%#{params[:title]}%")
    # binding.pry
    respond_to do |format|
      format.html { redirect_to :root }
        # ↓検索結果のデータをレスポンスするコード
      format.json { render json: @posts }
    end
  end
end