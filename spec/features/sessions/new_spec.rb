require 'rails_helper'

RSpec.describe 'Login Form', type: :feature do
  context 'as a user' do
    describe 'clickable elements' do
      it 'has a login form and confirms the user' do
        user = create(:user)
        visit login_path

        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button 'Log in'

        expect(page).to have_current_path(user_discover_path(user))
      end
      
      it 'redirects the user back to login and displays an error message when given incorrect information' do
        user = create(:user)
        visit login_path
  
        fill_in 'email', with: user.email
        fill_in 'password', with: 'wrong password'
        click_button 'Log in'
  
        expect(page).to have_current_path(login_path)
        expect(page).to have_css('#flash-alert', text: 'Email and/or password does not match a record on file')
      end
    end
  end
end
