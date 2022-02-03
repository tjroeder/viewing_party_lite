require 'rails_helper'

RSpec.describe Cast, type: :model do


  describe 'factory object' do
    it 'should build a valid cast object' do
      cast = build(:cast, data: {name: 'abc', character: 'xyz'})
      expect(cast).to be_a(Cast)
      expect(cast.data).to eq({name: 'abc', character: 'xyz'})
    end
  end
end
