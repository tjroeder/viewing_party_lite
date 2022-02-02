require 'rails_helper'

RSpec.describe Cast, type: :poro do
  describe 'object' do
    it 'exists and has attributes' do
      data = { name: 'Alec Guinness', character: 'Obi-Wan Kenobi' }
      cast_1 = Cast.new(data)

      expect(cast_1).to be_a(Cast)
      expect(cast_1).to have_attributes(name: 'Alec Guinness')
      expect(cast_1).to have_attributes(character: 'Obi-Wan Kenobi')
    end
  end
end