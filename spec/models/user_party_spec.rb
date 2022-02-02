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
end
