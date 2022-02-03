require 'rails_helper'

RSpec.describe CastService, type: :service do
  context 'class methods' do
    describe '::conn', :vcr do
      it 'returns casts' do
        casts = CastService.get_cast(11)
        expect(casts).to be_a(Hash)
        expect(casts[:cast]).to be_a(Array)
      end
    end
  end
end
