require 'rails_helper'

RSpec.describe 'New user' do

  describe 'view' do
    it 'I see a form to register a new user' do
      visit "/register"
      fill_in 'user_name', with: "name1"
      fill_in "user_email", with: "example@email.com"
      click_button("Register")
      expect(current_path).to eq("/users/#{User.last.id}")
      expect(page).to have_content("name1")
    end
  end
end
