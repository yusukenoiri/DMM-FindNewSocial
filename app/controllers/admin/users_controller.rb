class Admin::UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end
  
end
