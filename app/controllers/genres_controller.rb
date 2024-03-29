class GenresController < ApplicationController
  def index
    @posts_genre0 = Post.where(genre_id:0).order(created_at: :desc)
    @posts_genre1 = Post.where(genre_id:1).order(created_at: :desc)
    @posts_genre2 = Post.where(genre_id:2).order(created_at: :desc)
    @posts_genre3 = Post.where(genre_id:3).order(created_at: :desc)
    @posts_genre4 = Post.where(genre_id:4).order(created_at: :desc)
    @posts_genre5 = Post.where(genre_id:5).order(created_at: :desc)
    @posts = Post.all.order(created_at: :desc)
    posts = Post.where(created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day)
    @favorites = posts.where(id: PostAssessment.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
  end
end
