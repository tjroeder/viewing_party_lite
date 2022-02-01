require 'rails_helper'

RSpec.describe Party do
  describe "relationships" do
    it { should have_many(:guest_parties) }
    it { should belong_to(:user) }
    it { should have_many(:users).through(:guest_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:img_url) }
    it { should validate_presence_of(:movie_title) }
    it { should validate_presence_of(:runtime) }
  end
end
