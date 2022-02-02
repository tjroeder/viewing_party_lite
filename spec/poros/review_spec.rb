require 'rails_helper'

RSpec.describe Review, type: :poro do
  describe 'object' do
    it 'exists and has attributes' do
      data = { author: 'Taco', content: 'Great Movie!' }
      review_1 = Review.new(data)

      expect(review_1).to be_a(Review)
      expect(review_1).to have_attributes(author: 'Taco')
      expect(review_1).to have_attributes(content: 'Great Movie!')
    end
  end
end