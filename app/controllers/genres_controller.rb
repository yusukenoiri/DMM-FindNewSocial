class GenresController < ApplicationController
  def index
    @posts_genre0 = Post.where(genre_id:0)
    @posts_genre1 = Post.where(genre_id:1)
    @posts_genre2 = Post.where(genre_id:2)
    @posts_genre3 = Post.where(genre_id:3)
    @posts_genre4 = Post.where(genre_id:4)
    @posts_genre5 = Post.where(genre_id:5)
  end
end
