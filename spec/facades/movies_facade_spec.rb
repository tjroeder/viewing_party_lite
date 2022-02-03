require 'rails_helper'

RSpec.describe MoviesFacade, type: :facade do
  context 'class methods' do
    describe '::movie_reviews', :vcr do
      it 'should return array of review objects' do
        movie_review = MoviesFacade.movie_reviews(11)

        expect(movie_review).to be_a(Array)
        expect(movie_review[0]).to be_a(Review)
      end
    end

    describe '::top_20_movie_list', :vcr do
      it 'should return array movie objects' do
        movie_list = MovieFacade.movie_list
      end
    end
  end
end