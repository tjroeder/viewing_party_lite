# frozen_string_literal: true

class Movie
  attr_reader :title,
              :movie_id,
              :genres,
              :runtime,
              :vote_average,
              :summary,
              :cast,
              :reviews,
              :img_url

  def initialize(data, cast = nil, reviews = nil)
    @title = data[:title]
    @movie_id = data[:id]
    @genres = create_genres(data)
    @runtime = data[:runtime]
    @vote_average = data[:vote_average]
    @summary = data[:overview]
    @cast = cast
    @reviews = reviews
    @img_url = data[:poster_path]
  end

  def create_genres(data)
    data[:genres]&.pluck(:name)&.join(', ')
  end

  def runtime_formatted
    if (@runtime / 60).to_i > 1
      "#{(@runtime / 60).to_i} hrs #{(@runtime % 60).to_i} min"
    else
      "#{(@runtime / 60).to_i} hr #{(@runtime % 60).to_i} min"
    end
  end

  def review_count
    @reviews.count
  end
end
