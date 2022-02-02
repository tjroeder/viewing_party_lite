class Movie
  attr_reader :title,
              :movie_id,
              :genres,
              :runtime,
              :vote_average,
              :summary,
              :cast,
              :reviews

  def initialize(data)
    @title = data[:original_title]
    @movie_id = data[:id]
    @genres = create_genres(data)
    @runtime = data[:runtime]
    @vote_average = data[:vote_average]
    @summary = data[:overview]
    @cast = nil
    @reviews = nil
  end

  # def self.create_cast

  # end

  # def self.create_reviews

  # end

  def create_genres(data)
    data[:genres].pluck(:name).join(', ')
  end
end