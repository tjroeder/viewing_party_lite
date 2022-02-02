require 'rails_helper'

RSpec.describe 'New party' do

  describe 'view' do
    it 'I see a form to make a new viewing party' do
      user_list = create_list(:user, 4)
      visit "/parties/new"
      fill_in 'Duration', with: 444
      fill_in 'When', with: Date.today
      fill_in 'Start time', with: Time.now
      # save_and_open_page
    end
  end
end
