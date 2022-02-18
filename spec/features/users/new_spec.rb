# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New user' do
  context 'as a user' do
    before(:each) do
      @user = create(:user)
      visit login_path
      
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_button 'Log in'
    end
    
    describe 'clickable elements' do
      it 'has a form that creates new users' do
        visit '/register'
        fill_in 'user_name', with: 'name1'
        fill_in 'user_email', with: 'example@email.com'
        fill_in 'user_password', with: 'test123'
        fill_in 'user_password_confirmation', with: 'test123'
        click_button('Register')
        
        expect(current_path).to eq("/users/#{User.last.id}")
        expect(page).to have_content('name1')
      end
      
      it 'returns a user back to register with error message if missing info' do
        visit '/register'
        fill_in 'user_name', with: 'name1'
        fill_in 'user_password', with: 'test123'
        fill_in 'user_password_confirmation', with: 'test123'
        click_button('Register')
        
        expect(current_path).to eq(register_path)
        expect(page).to have_css('#flash-alert', text: 'Please include name, email and matching passwords.')
      end
      
      it 'returns a user back to register with error message if password mismatch' do
        visit '/register'
        fill_in 'user_name', with: 'name1'
        fill_in 'user_email', with: 'example@email.com'
        fill_in 'user_password', with: 'test123'
        fill_in 'user_password_confirmation', with: 'test'
        click_button('Register')
        
        expect(current_path).to eq(register_path)
        expect(page).to have_css('#flash-alert', text: 'Please include name, email and matching passwords.')
      end
    end
  end
end
