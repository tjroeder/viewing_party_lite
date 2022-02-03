require 'rails_helper'

RSpec.describe ReviewService, type: :service do
  context 'class methods' do
    describe '::conn' do
      it 'returns reviews' do
        VCR.use_cassette('movie_reviews_2022_02_02') do
          reviews = ReviewService.get_reviews(11)
        end
      end
    end
  end
end