require 'rails_helper'

RSpec.describe 'Users show page', type: :feature do
  context 'as a user' do
    let!(:user_1) { create(:user, name: 'Mara') }
    before(:each) { visit user_path(user_1) }

    describe 'viewable elements', :vcr do
      it 'displays users name dashboard at the top of the page' do
        expect(page).to have_css('h2', text: "#{user_1.name}'s Dashboard")
      end

      it 'displays a button called discover movies' do
        expect(page).to have_button('Discover Movies')
      end

      it 'displays a viewing party section' do
        movie = MovieFacade.create_movie(11)
        party = Party.create!(movie_title: movie.title, movie_id: movie.movie_id, time: Time.now, date: Date.today, runtime: movie.runtime, img_url: movie.img_url )
        user_party = UserParty.create!(user_id: user_1.id, party_id: party.id, host_status: 1)
        visit user_path(user_1)
        expect(page).to have_content('Viewing Parties')
        expect(page).to have_content(movie.title)
        expect(page).to have_content(user_party.host_status)
        expect(page).to have_css('img[src="https://image.tmdb.org/t/p/w92//6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg"]')
      end
    end

    describe 'clickable elements' do
      it 'redirects the user to the discover page' do
        expect(page).to have_current_path(user_path(user_1))
        click_on 'Discover Movies'

        expect(page).to have_current_path(user_discover_path(user_1))
      end
    end
  end
end
