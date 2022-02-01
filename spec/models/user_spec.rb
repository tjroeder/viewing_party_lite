require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many(:parties)}
    it { should have_many(:guest_parties) }
    it { should have_many(:parties).through(:guest_parties) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
  end

  describe 'factory object' do
    it 'should build a valid user object' do
      user = build(:user, email: 'fake_email@gmail.com', name: 'fake name')

      expect(user).to be_a(User)
      expect(user.email).to eq('fake_email@gmail.com')
      expect(user.name).to eq('fake name')
    end
  end
end
