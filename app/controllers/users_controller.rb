class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.order(created_at: :desc)
    @posts =Post.all.order(created_at: :desc).page(params[:page]).per(10)

    @genre_id_hash = { "公共交通" => 0, "インフラ" => 0, "ヘルスケア" => 0, "生活" => 0, "地域" => 0, "その他" => 0 }
    @posts.each do |post|
      @genre_id_hash[post.genre_id] = @genre_id_hash[post.genre_id] + 1
    end


    @generation_id_hash = {"10代"=> 0, "20代"=> 0, "30代"=> 0, "40代"=> 0, "50代"=> 0, "60代"=> 0, "70歳以上"=> 0 }
    @posts.each do |post|
      @generation_id_hash[post.generation] = @generation_id_hash[post.generation] + 1
    end

    posts = Post.where(created_at: 1.week.ago.beginning_of_day..Time.zone.now)
    @favorites = posts.where(id: PostAssessment.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
    # @post_today = Post.where(created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day)
    # @post_yesterday = Post.where(created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day)
  end

  def edit
    @user = User.find(params[:id])
  end

  def confirm
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    respond_to do |format|
      if @user.save
        redirect_to user_path(@user)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :created, location: @user }
        format.js { @status = "success" }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
  end


  def hide
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :occupation, :nick_name, :first_name,
    :first_name_kana, :family_name, :family_name_kana, :address, :phone_number, :email, :sex, :generation, :introduction)
  end

end
