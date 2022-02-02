# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Application Layout', type: :feature do
  context 'as a user' do
    describe 'viewable elements' do
      it 'has a header containing the website name' do
        visit root_path

        expect(page).to have_content('Viewing Party Light')
      end
    end

    describe 'clickable elements' do
      it 'has a link to redirect the user back to the home page' do
        visit root_path

        expect(page).to have_link('Home', href: root_path)
      end

      it 'redirects the user back to the home page' do
        visit register_path
        click_on 'Home'

        expect(page).to have_current_path(root_path)
      end
    end
  end
end