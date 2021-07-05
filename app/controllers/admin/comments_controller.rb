class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comments = Comment.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def invalid
    @comment = Comment.find(params[:id])
    @comment.update(is_valid: false)
    redirect_to admin_posts_path
  end
end
