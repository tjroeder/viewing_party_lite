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

    describe '::movie_casts', :vcr do
      it 'should return array of cast objects' do
        movie_cast = MoviesFacade.movie_casts(11)
        expect(movie_cast).to be_a(Array)
        expect(movie_cast[0]).to be_a(Cast)
        expect(movie_cast.length).to eq(10)
      end

      it 'should return an array of objects even if cast is less than 10' do
        movie_cast2 = MoviesFacade.movie_casts(49047)
        expect(movie_cast2.length).to eq(7)
      end 
    end

    # describe '::movie_list' do

    # end
  end
end
