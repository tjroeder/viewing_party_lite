require 'rails_helper'

RSpec.describe Movie, type: :model do


  describe 'factory object' do
    it 'should build a valid movie object' do
      movie = build(:movie, title: "abc", movie_id: 5, genres: "xyz", runtime: 11, vote_average: 3, summary: "defsdfksdfm")

      expect(movie).to be_a(Movie)
      expect(movie.title).to eq('abc')
      expect(movie.movie_id).to eq(5)
      expect(movie.genres).to eq('xyz')
      expect(movie.runtime).to eq(11)
      expect(movie.vote_average).to eq(3)
      expect(movie.summary).to eq("defsdfksdfm")
      expect(movie.cast).to be_a(Cast)
      expect(movie.reviews).to be_a(Review)
    end
  end
end
