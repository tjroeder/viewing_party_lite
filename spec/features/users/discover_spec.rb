require 'rails_helper'

RSpec.describe 'User Discover Movies Page', type: :feature do
  context 'as a user' do
    let!(:user_1) { create(:user) }
    before(:each) { visit user_discover_path(user_1) }

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

    describe 'clickable elements' do
      it 'redirects the user to the top rated movies view' do
        expect(page).to have_current_path(user_discover_path(user_1))
        click_on 'Find Top Rated Movies'

        expect(page).to have_current_path(user_movies_path(user_1, params: { q: 'top_20_rated' }))
      end

      it 'redirects the user to a list of movies from the search parameter' do
        fill_in :q, with: 'Star Wars'
        click_button 'Find Movies'
        
        expect(page).to have_current_path(user_movies_path(user_1, params: { q: 'Star Wars' }))
      end
    end
  end
end
