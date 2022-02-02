require 'rails_helper'

RSpec.describe Movie, type: :poro do
  describe 'object' do
    it 'exists and has attributes' do
      genres = [{ id: 18, name: 'Adventure' }, { id: 14, name: 'Action' }]
      data = { original_title: 'Star Wars', id: 11, genres: genres, runtime: 160, vote_average: 9.1, overview: 'In a galaxy far, far away' }
      movie_1 = Movie.new(data)

      expect(movie_1).to be_a(Movie)
      expect(movie_1).to have_attributes(title: 'Star Wars')
      expect(movie_1).to have_attributes(movie_id: 11)
      expect(movie_1).to have_attributes(genres: 'Adventure, Action')
      expect(movie_1).to have_attributes(runtime: 160)
      expect(movie_1).to have_attributes(vote_average: 9.1)
      expect(movie_1).to have_attributes(summary: 'In a galaxy far, far away')
    end
  end

  # describe 'factory object' do
  #   it 'should build a valid movie object' do
  #     genres = [{ id: 18, name: 'Adventure' }, { id: 14, name: 'Action' }]
  #     data = { original_title: 'Star Wars', id: 11, genres: genres, runtime: 160, vote_average: 9.1, overview: 'In a galaxy far, far away' }

  #     movie = build(:movie, title: 'abc', movie_id: 5, genres: 'xyz', runtime: 11, vote_average: 3, summary: 'defsdfksdfm')
  
  #     expect(movie).to be_a(Movie)
  #     expect(movie.title).to eq('abc')
  #     expect(movie.movie_id).to eq(5)
  #     expect(movie.genres).to eq('xyz')
  #     expect(movie.runtime).to eq(11)
  #     expect(movie.vote_average).to eq(3)
  #     expect(movie.summary).to eq('defsdfksdfm')
  #   end
  # end
end