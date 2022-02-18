# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User movies show/detail page', type: :feature do
  context 'as a user', :vcr do
    before(:each) do
      @user = create(:user)
      visit login_path
      
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_button 'Log in'
    end

    let!(:movie_1) { MovieFacade.create_movie(11) }
    before(:each) { visit user_movie_path(@user, movie_1.movie_id) }

    describe 'viewable elements' do
      it 'displays header of the movie title' do
        expect(page).to have_css('h2', text: 'Star Wars')
      end

      it 'displays a button to return to discover page' do
        expect(page).to have_button('Discover Page')
      end

      it 'displays a button to create a new viewing party for user movie' do
        expect(page).to have_button("Create Viewing Party for #{movie_1.title}")
      end

      it 'displays the vote average' do
        expect(page).to have_content("Vote Average: #{movie_1.vote_average}")
      end

      it 'displays the movie runtime' do
        expect(page).to have_content("Runtime: #{movie_1.runtime_formatted}")
      end

      it 'displays the movie genres' do
        expect(page).to have_content("Genre(s): #{movie_1.genres}")
      end

      it 'displays the movie summary' do
        expect(page).to have_css('h4', text: 'Summary')
        expect(page).to have_content(movie_1.summary)
      end

      it 'displays the 10 cast members' do
        expect(page).to have_css('h4', text: 'Cast')

        within('#cast') do
          expect(page).to have_css('p', count: 10)
          expect(page).to have_content("#{movie_1.cast.first.name} as #{movie_1.cast.first.character}")
        end
      end

      it 'displays the count of the reviews for the movie' do
        expect(page).to have_content("#{movie_1.review_count} Reviews")
      end

      it 'displays author and content for a review' do
        expect(page).to have_content("Author: #{movie_1.reviews.first.author}")
        first_line = "(As I'm writing this review, Darth Vader's theme music begins to build in my mind...)"

        within('#review-1') do
          expect(page).to have_content(first_line)
        end
      end

      it 'displays all movie reviews on the page' do
        within('#reviews') do
          expect(page).to have_css('h4', count: 4)
        end
      end
    end

    describe 'clickable elements' do
      it 'returns back to the discover page when clicked' do
        click_on 'Discover Page'

        expect(page).to have_current_path(user_discover_path(@user))
      end

      it 'redirects to create a new viewing party for the user movie' do
        click_on "Create Viewing Party for #{movie_1.title}"

        expect(page).to have_current_path(new_user_movie_viewing_party_path(@user, movie_1.movie_id))
      end
    end
  end
end
