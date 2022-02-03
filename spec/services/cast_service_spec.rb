require 'rails_helper'

RSpec.describe CastService, type: :service do
  context 'class methods' do
    describe '::conn', :vcr do
      it 'returns Faraday connection' do
        cast = CastService.conn

        expect(cast).to be_a(Faraday::Connection)
      end
    end

    describe '::get_cast', :vcr do
      it 'returns cast data' do
        cast = CastService.get_cast(11)

        expect(cast).to be_a(Hash)
        expect(cast[:cast]).to be_a(Array)
      end
    end
  end
end
