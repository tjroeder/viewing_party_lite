class ReviewService
  def self.get_reviews(movie_id)
    response = conn(movie_id).get
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn(movie_id)
    url = "https://api.themoviedb.org/3/movie/#{movie_id}/reviews"

    Faraday.new(url: url) do |f|
      f.params['api_key'] = ENV['tmdb_api_key']
      f.adapter Faraday.default_adapter
    end
  end
end
