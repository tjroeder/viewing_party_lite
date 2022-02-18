# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users show page', type: :feature do
  context 'as a user' do
    before(:each) do
      @user = create(:user, name: 'Mara')
      visit login_path
      
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_button 'Log in'
    end

    before(:each) { visit user_path(@user) }

    describe 'viewable elements', :vcr do
      it 'displays users name dashboard at the top of the page' do
        expect(page).to have_css('h2', text: "#{@user.name}'s Dashboard")
      end

      it 'displays a button called discover movies' do
        expect(page).to have_button('Discover Movies')
      end

      it 'displays a viewing party section' do
        movie = MovieFacade.create_movie(11)
        party = Party.create!(movie_title: movie.title, movie_id: movie.movie_id, time: Time.zone.now, date: Date.today, runtime: movie.runtime, img_url: movie.img_url, duration: 1000)
        guest = User.create!(name: 'Kelly', email: 'k@gmail.com', password: 'test1', password_confirmation: 'test1')
        guest2 = User.create!(name: 'Tim', email: 't@gmail.com', password: 'test2', password_confirmation: 'test2')
        guest3 = User.create!(name: 'Seth', email: 's@gmail.com', password: 'test3', password_confirmation: 'test3')
        user_party = UserParty.create!(user_id: @user.id, party_id: party.id, host_status: 1)
        user_party2 = UserParty.create!(user_id: guest.id, party_id: party.id, host_status: 0)
        user_party3 = UserParty.create!(user_id: guest3.id, party_id: party.id, host_status: 0)

        visit user_path(@user)

        expect(page).to have_content('Viewing Parties')
        expect(page).to have_content(movie.title)
        expect(page).to have_content(user_party.host_status)
        expect(page).to have_css('img[src="https://image.tmdb.org/t/p/w92//6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg"]')
        expect(page).to have_content("Guests: #{guest.name} #{guest3.name}")
      end

      it 'the movie title links to the movie show page' do
        movie = MovieFacade.create_movie(11)
        party = Party.create!(movie_title: movie.title, movie_id: movie.movie_id, time: Time.zone.now, date: Date.today, runtime: movie.runtime, img_url: movie.img_url, duration: 1000)
        user_party = UserParty.create!(user_id: @user.id, party_id: party.id, host_status: 1)
        visit user_path(@user)
        expect(page).to have_link(movie.title.to_s)
        click_link movie.title.to_s
        expect(current_path).to eq(user_movie_path(@user, movie.movie_id))
      end
    end

    describe 'clickable elements' do
      it 'redirects the user to the discover page' do
        expect(page).to have_current_path(user_path(@user))
        click_on 'Discover Movies'

        expect(page).to have_current_path(user_discover_path(@user))
      end
    end
  end
end
