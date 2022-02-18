# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New party' do
  describe 'view', :vcr do
    before(:each) do
      @user = create(:user)
      visit login_path
      
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_button 'Log in'
    end

    describe 'happy path' do
      it 'I see a form to make a new viewing party' do
        movie = MovieFacade.create_movie(11)
        user = User.create!(name: 'Kelly', email: 'k@gmail.com', password: 'test1', password_confirmation: 'test1')
        guest = User.create!(name: 'Rosie', email: 'r@gmail.com', password: 'test2', password_confirmation: 'test2')
        guest2 = User.create!(name: 'Tim', email: 't@gmail.com', password: 'test3', password_confirmation: 'test3')
        guest3 = User.create!(name: 'Seth', email: 's@gmail.com', password: 'test4', password_confirmation: 'test4')
        visit "/users/#{user.id}/movies/#{movie.movie_id}/viewing_party/new"

        fill_in 'Duration', with: 444
        fill_in 'Date', with: Date.today
        fill_in 'Time', with: Time.zone.now
        page.check(guest.name)
        page.check(user.name)
        click_button 'Create Party'

        expect(current_path).to eq("/users/#{user.id}")
        expect(page).to have_content(movie.title)
      end
    end

    describe 'sad path' do
      it 'returns the user back to the viewing party form if incorrect info' do
        movie = MovieFacade.create_movie(11)
        user = User.create!(name: 'Kelly', email: 'k@gmail.com', password: 'test1', password_confirmation: 'test1')
        guest = User.create!(name: 'Rosie', email: 'r@gmail.com', password: 'test2', password_confirmation: 'test2')
        guest2 = User.create!(name: 'Tim', email: 't@gmail.com', password: 'test3', password_confirmation: 'test3')
        guest3 = User.create!(name: 'Seth', email: 's@gmail.com', password: 'test4', password_confirmation: 'test4')
        visit "/users/#{user.id}/movies/#{movie.movie_id}/viewing_party/new"

        fill_in 'Duration', with: 1
        fill_in 'Date', with: Date.today
        fill_in 'Time', with: Time.zone.now
        page.check(guest.name)
        click_button 'Create Party'
        
        expect(current_path).to eq("/users/#{user.id}/movies/#{movie.movie_id}/viewing_party/new")
      end
    end
  end
end
