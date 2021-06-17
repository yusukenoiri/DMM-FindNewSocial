class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.order(created_at: :desc)
    @posts =Post.all.order(created_at: :desc)
    @favorites = Post.find(PostAssessment.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
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
        # 追加
        format.js { @status = "success" }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        # 追加
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
