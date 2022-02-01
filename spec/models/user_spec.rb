require 'rails_helper'

RSpec.describe User do
  describe "relationships" do
    it { should have_many(:parties)}
    it { should have_many(:guest_parties) }
    it { should have_many(:parties).through(:guest_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
  end
end
