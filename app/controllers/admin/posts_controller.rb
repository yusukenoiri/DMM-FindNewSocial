class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
  end
end
