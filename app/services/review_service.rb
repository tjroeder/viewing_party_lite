class ReviewService
  def self.get_reviews(movie_id)
    response = conn.get("movie/#{movie_id}/reviews")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    url = 'https://api.themoviedb.org/3/'

    Faraday.new(url: url, params: { api_key: ENV['tmdb_api_key'] })
  end
end
