class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @genre_id_hash = { "公共交通" => 0, "インフラ" => 0, "ヘルスケア" => 0, "生活" => 0, "地域" => 0, "その他" => 0 }
    @posts.each do |post|
      @genre_id_hash[post.genre_id] = @genre_id_hash[post.genre_id] + 1
    end
  end

  def update
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    redirect_to admin_users_path
  end

end
