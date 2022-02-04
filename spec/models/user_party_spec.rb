# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserParty, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:party) }
  end

  describe 'factory object' do
    it 'builds valid factory object' do
      guest_party = build(:user_party)

      expect(guest_party).to be_a(UserParty)
      expect(guest_party.user).to be_a(User)
      expect(guest_party.party).to be_a(Party)
      expect(guest_party.host_status).to eq('guest')
    end
  end

  describe 'Class methods', :vcr do
    describe 'Guests' do
      it 'happy path' do
        user_1 = User.create!(name: 'Mara', email: 'abc@gmail.com')
        movie = MovieFacade.create_movie(11)
        party = Party.create!(movie_title: movie.title, movie_id: movie.movie_id, time: Time.zone.now, date: Date.today, runtime: movie.runtime, img_url: movie.img_url, duration: 1000)
        guest = User.create!(name: 'Kelly', email: 'k@gmail.com')
        guest2 = User.create!(name: 'Tim', email: 't@gmail.com')
        guest3 = User.create!(name: 'Seth', email: 's@gmail.com')
        user_party = UserParty.create!(user_id: user_1.id, party_id: party.id, host_status: 1)
        user_party2 = UserParty.create!(user_id: guest.id, party_id: party.id, host_status: 0)
        user_party3 = UserParty.create!(user_id: guest3.id, party_id: party.id, host_status: 0)
        expect(UserParty.guests(user_party.party_id)).to eq([guest.name, guest3.name])
      end
      it 'sad path' do
        user_1 = User.create!(name: 'Mara', email: 'abc@gmail.com')
        movie = MovieFacade.create_movie(11)
        party = Party.create!(movie_title: movie.title, movie_id: movie.movie_id, time: Time.zone.now, date: Date.today, runtime: movie.runtime, img_url: movie.img_url, duration: 1000)
        guest = User.create!(name: 'Kelly', email: 'k@gmail.com')
        guest2 = User.create!(name: 'Tim', email: 't@gmail.com')
        guest3 = User.create!(name: 'Seth', email: 's@gmail.com')
        user_party = UserParty.create!(user_id: user_1.id, party_id: party.id, host_status: 1)
        user_party2 = UserParty.create!(user_id: guest.id, party_id: party.id, host_status: 0)
        expect(UserParty.guests(user_party.party_id)).to eq([guest.name])
      end
    end
  end
end
