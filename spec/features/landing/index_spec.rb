# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing index' do
  context 'when not logged in as a user' do
    describe 'clickable elements' do
      it 'has a button to create a new user' do
        visit root_path
        click_button 'Create a New User'
        
        expect(current_path).to eq('/register')
      end
      
      it 'has no links to other users' do
        user_list = create_list(:user, 4)
        visit root_path
        
        expect(page).not_to have_link("#{user_list[0].email}'s Dashboard")
        expect(page).not_to have_link("#{user_list[1].email}'s Dashboard")
        expect(page).not_to have_link("#{user_list[2].email}'s Dashboard")
        expect(page).not_to have_link("#{user_list[3].email}'s Dashboard")
      end
      
      it 'has a button to redirect to the user log in page' do
        visit root_path
        click_button 'Log in'
        
        expect(page).to have_current_path(login_path)
      end
    end
  end

  context 'when logged in as a user' do
    before(:each) do
      @user = create(:user)
      visit login_path
      
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_button 'Log in'
    end

    describe 'viewable elements' do
      describe 'clickable elements' do
        it 'displays a logout button that redirects to landing page' do
          expect(page).to have_current_path(discover_path(@user))
          expect(page).to have_content(@user.email)
          visit root_path
          click_button 'Logout'
          
          expect(page).not_to have_content(@user.email)
          expect(page).not_to have_button('Logout')
          expect(page).to have_current_path(root_path)
        end
      end
    end
  end
end
