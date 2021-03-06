require 'rails_helper'

RSpec.describe 'user show' do
  describe 'happy paths' do
    it 'can be shown' do
      user = User.first
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit "/users/#{user.id}"

      expect(page).to have_content("Billy Joel")
      expect(page).to have_content("Followers: 4")
      expect(page).to have_content("Following: 1")
      expect(page).to have_content("Billy Joel's Tracks")
      expect(page).to have_content(user.beats.first.name)
      expect(page).to have_content(user.beats.last.name)
    end
  end
  describe 'sad paths' do
    it 'cannot be registered without username' do
      visit "/users/12345"

      expect(page).to have_content("It appears the user you're looking for does not exist")
    end
  end
end
