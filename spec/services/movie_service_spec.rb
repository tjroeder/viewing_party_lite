require 'rails_helper'

RSpec.describe MovieService, type: :service do
  context 'class methods', :vcr do
    describe '::conn' do
      it 'returns Faraday connection' do
        movie = MovieService.conn

        expect(movie).to be_a(Faraday::Connection)
      end
    end

    describe '::get_movie' do
      it 'returns hash of movie details' do
        movie = MovieService.get_movie(11)

        expect(movie).to be_a(Hash)
      end
    end

    describe '::top_rated_movies' do
      it 'returns hash of top movies' do
        top_rated = MovieService.top_rated_movies

        expect(top_rated).to be_a(Hash)
      end
    end
  end
end
