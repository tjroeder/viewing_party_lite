require 'rails_helper'

RSpec.describe Review, type: :model do


  describe 'factory object' do
    it 'should build a valid review object' do
      review = build(:review, author: 'abc', content: 'xyz')
      expect(review).to be_a(Review)
      expect(review.author).to eq('abc')
      expect(review.content).to eq('xyz')
    end
  end
end
