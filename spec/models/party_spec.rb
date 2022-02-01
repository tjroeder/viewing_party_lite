require 'rails_helper'

RSpec.describe Party, type: :model do
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

  describe 'factory object' do
    let!(:user) { build(:user) }
    let!(:party) { build(:party, user: user, movie_id: 55, date: Date.new(2000, 1, 5), time: '02:02:02', img_url: '/best_movie.jpg', runtime: 124) }

    it 'should build valid Party object' do
      expect(party).to be_a(Party)
      expect(party.movie_id).to eq(55)
      expect(party.date).to eq(Date.new(2000, 1, 5))
      expect(party.time).to eq('2000-01-01 02:02:02.000000000 +0000')
      expect(party.img_url).to eq('/best_movie.jpg')
      expect(party.runtime).to eq(124)
      expect(party.user).to eq(user)
    end
  end
end
