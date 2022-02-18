# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Discover Movies Page', type: :feature do
  context 'as a user' do
    before(:each) do
      @user = create(:user)
      visit login_path
      
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_button 'Log in'
    end

    before(:each) { visit user_discover_path(@user) }

    describe 'viewable elements' do
      it 'displays a header with discover movies' do
        expect(page).to have_css('h2', text: 'Discover Movies')
      end

      it 'displays a button to find top rated movies' do
        expect(page).to have_button('Find Top Rated Movies')
      end

      it 'displays a search field and submit button to find movies' do
        expect(page).to have_field(:q, placeholder: 'Search by movie title')
        expect(page).to have_button('Find Movies')
      end
    end

    describe 'clickable elements', :vcr do
      it 'redirects the user to the top rated movies view' do
        expect(page).to have_current_path(user_discover_path(@user))
        click_on 'Find Top Rated Movies'

        expect(page).to have_current_path(user_movies_path(@user, params: { q: 'top_20_rated' }))
      end

      it 'redirects the user to a list of movies from the search parameter' do
        fill_in :q, with: 'Star Wars'
        click_button 'Find Movies'

        expect(page).to have_current_path(user_movies_path(@user, params: { q: 'Star Wars' }))
      end
    end
  end
end
