class NewsController < ApplicationController

  def data
    if params[:genre].present?
      @genre = params[:genre]
    else
      @genre = ""
    end
    uri = URI.parse('https://newsapi.org/v2/top-headlines?country=jp&category=' + @genre + "&apiKey=#{ENV['NEWS_API_KEY_ID']}")
    json = Net::HTTP.get(uri)
    moments = JSON.parse(json)
    @data = moments['articles'].first(5).to_json
  end

end
