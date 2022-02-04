# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Movies results index page', type: :feature do
  context 'as a user' do
    let!(:user_1) { create(:user) }
    before(:each) { visit user_discover_path(user_1) }

    describe 'viewable elements', :vcr do
      it 'displays header top rated movies when selected' do
        click_on 'Find Top Rated Movies'

        expect(page).to have_current_path(user_movies_path(user_1, params: { q: 'top_20_rated' }))
        expect(page).to have_content('Top Rated Movies')
        expect(page).to have_no_content('Movie results for: ')
      end

      it 'displays header with the search query if searching' do
        fill_in :q, with: 'Star Wars'
        click_button 'Find Movies'

        expect(page).to have_current_path(user_movies_path(user_1, params: { q: 'Star Wars' }))
        expect(page).to have_content('Movie results for: Star Wars')
        expect(page).to have_no_content('Top Rated Movies')
      end

      it 'displays a button to return to discover page when on top rated' do
        click_on 'Find Top Rated Movies'

        expect(page).to have_button('Discover Page')
      end

      it 'displays a button to return to discover page when searching' do
        fill_in :q, with: 'Star Wars'
        click_button 'Find Movies'

        expect(page).to have_button('Discover Page')
      end

      it 'does not display no movies found if search returns movies' do
        fill_in :q, with: 'Star Wars'
        click_button 'Find Movies'

        expect(page).to have_no_content('No movies found')
      end

      it 'displays no movies found if search has no returns' do
        fill_in :q, with: 'asdflaskldfjklasdf'
        click_button 'Find Movies'

        expect(page).to have_content('No movies found')
      end

      it 'displays 20 names and average of the top rated movies' do
        click_on 'Find Top Rated Movies'

        within('section') do
          expect(page).to have_css('p', count: 20)

          within('#movie-730154') do
            expect(page).to have_content('Your Eyes Tell ---- Vote Average: 8.8')
          end
        end
      end

      it 'displays 40 names and averages if there are over 40 movie matches' do
        fill_in :q, with: 'star'
        click_button 'Find Movies'

        within('section') do
          expect(page).to have_css('p', count: 40)

          within('#movie-11') do
            expect(page).to have_content('Star Wars ---- Vote Average: 8.2')
          end
        end
      end

      it 'displays less than 40 names and averages if less than 40 matches' do
        fill_in :q, with: 'spaceballs'
        click_button 'Find Movies'

        within('section') do
          expect(page).to have_css('p', count: 2)

          within('#movie-957') do
            expect(page).to have_content('Spaceballs ---- Vote Average: 6.8')
          end
        end
      end
    end

    describe 'clickable elements', :vcr do
      it 'returns back to the discover page when clicked' do
        click_on 'Find Top Rated Movies'
        click_on 'Discover Page'

        expect(page).to have_current_path(user_discover_path(user_1))
      end

      it 'each movie has links redirecting to view the movie details' do
        click_on 'Find Top Rated Movies'

        within('section') do
          expect(page).to have_css('a', count: 20)

          within('#movie-730154') do
            expect(page).to have_link('Your Eyes Tell', href: user_movie_path(user_1, 730_154))

            click_on 'Your Eyes Tell'
          end
        end

        expect(page).to have_current_path(user_movie_path(user_1, 730_154))
        expect(page).to have_content('Your Eyes Tell')
      end
    end
  end
end
