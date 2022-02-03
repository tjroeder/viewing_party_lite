require 'rails_helper'

RSpec.describe MovieService, type: :service do
  context 'class methods', :vcr do
    describe '::conn' do
      it 'returns Faraday connection' do
        reviews = MovieService.conn

        expect(reviews).to be_a(Faraday::Connection)
      end
    end

    describe '::movie' do
      it 'returns hash of movie details' do
        reviews = MovieService.movie(11)

        expect(reviews).to be_a(Hash)
      end
    end

    describe '::top_rated_movies' do
      it 'returns hash of top movies' do
        # json_response = File.read('spec/fixtures/top_rated_movies.json')
        # stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['tmdb_api_key']}").to_return(status: 200, body: json_response)
  
        top_rated = MovieService.top_rated_movies
        require 'pry'; binding.pry
        expect(top_rated).to be_a(Hash)
      end
    end
  end
end
