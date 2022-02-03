require 'rails_helper'

RSpec.describe ReviewService, type: :service do
  context 'class methods' do
    describe '::conn', :vcr do
      it 'returns Faraday connection' do
        reviews = ReviewService.conn(11)

        expect(reviews).to be_a(Faraday::Connection)
      end
    end
    
    describe '::get_reviews', :vcr do
      it 'returns hash of reviews' do
        reviews = ReviewService.get_reviews(11)
        
        expect(reviews).to be_a(Hash)
      end
    end
  end
end
