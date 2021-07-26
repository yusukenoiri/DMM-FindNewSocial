class HomesController < ApplicationController

  def top
    posts = Post.all
    @genre_id_hash = { "公共交通" => 0, "インフラ" => 0, "ヘルスケア" => 0, "生活" => 0, "地域" => 0, "その他" => 0 }
    posts.each do |post|
      @genre_id_hash[post.genre_id] = @genre_id_hash[post.genre_id] + 1
    end

    @generation_id_hash = {"10代"=> 0, "20代"=> 0, "30代"=> 0, "40代"=> 0, "50代"=> 0, "60代"=> 0, "70歳以上"=> 0 }
    posts.each do |post|
      @generation_id_hash[post.generation] = @generation_id_hash[post.generation] + 1
    end
  end

  def about
  end

end
