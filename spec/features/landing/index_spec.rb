# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing index' do
  describe 'clickable elements' do
    it 'has a button to create a new user' do
      visit root_path
      click_button 'Create a New User'

      expect(current_path).to eq('/register')
    end
  
    it 'has a list of existing users which links to the users dashboard' do
      user_list = create_list(:user, 4)
      visit root_path

      expect(page).to have_link("#{user_list[0].email}'s Dashboard")
      expect(page).to have_link("#{user_list[1].email}'s Dashboard")
      expect(page).to have_link("#{user_list[2].email}'s Dashboard")
      expect(page).to have_link("#{user_list[3].email}'s Dashboard")

      click_link "#{user_list[0].email}'s Dashboard"

      expect(current_path).to eq("/users/#{user_list[0].id}")
    end

    it 'has a button to redirect to the user log in page' do
      visit root_path
      click_button 'Log in'
  
      expect(page).to have_current_path(login_path)
    end
  end
end
