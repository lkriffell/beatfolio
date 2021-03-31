require 'rails_helper'

RSpec.describe 'likes index' do
  describe 'happy paths' do
    it 'shows beats a user has liked' do      
      visit "/users/#{User.first.id}/likes"

      expect(page).to have_content('YOURE FOLLOWING ME')

      expect(page).to_not have_content('The Dopest Track Ever Made')
    end
  end
  describe 'sad paths' do
    it 'shows a message if a user has no liked beats' do      
      visit "/users/#{User.last.id}/likes"

      expect(page).to have_content("#{User.last.username} has no liked tracks yet!")
    end
  end
end
