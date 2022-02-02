require 'rails_helper'

RSpec.describe 'Users show page', type: :feature do
  context 'as a user' do
    let!(:user_1) { create(:user, name: 'Mara') }
    before(:each) { visit user_path(user_1) }

    describe 'viewable elements' do
      it 'displays users name dashboard at the top of the page' do
        expect(page).to have_css('h2', text: "#{user_1.name}'s Dashboard")
      end

      it 'displays a button called discover movies' do
        expect(page).to have_button('Discover Movies')
      end

      it 'displays a viewing party section' do
        expect(page).to have_content('Viewing Parties')
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
