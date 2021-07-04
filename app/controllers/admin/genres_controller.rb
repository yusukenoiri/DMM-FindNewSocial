class Admin::GenresController < ApplicationController
  def index
    @posts = Post.all
    @genre_id_hash = { "公共交通" => 0, "インフラ" => 0, "ヘルスケア" => 0, "生活" => 0, "地域" => 0, "その他" => 0 }
    @posts.each do |post|
      @genre_id_hash[post.genre_id] = @genre_id_hash[post.genre_id] + 1
    end

    @generation_id_hash = {"10代"=> 1, "20代"=> 2, "30代"=> 3, "40代"=> 4, "50代"=> 5, "60代"=> 6, "70歳以上"=> 7 }
    @posts.each do |post|
      @generation_id_hash[post.generation] = @generation_id_hash[post.generation] + 1
    end
  end
end
