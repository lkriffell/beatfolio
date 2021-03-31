require 'rails_helper'

RSpec.describe 'like' do
  before :each do 
    @user = User.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'happy paths' do
    it 'can be liked and unliked' do
      beat = Beat.first
      
      visit "/beats/#{beat.id}"
      expect(beat.likes.size).to eq(0)

      click_button "0 👍"
      
      expect(page).to have_content("1 👍")

      click_button "1 👍"
      
      expect(page).to have_content("0 👍")
    end
  end
  describe 'sad paths' do
    it "cant be liked twice" do
      beat = Beat.first
      
      visit "/beats/#{beat.id}"

      expect(page).to have_content("0 👍")

      click_button "0 👍"

      expect(page).to have_content("1 👍")

      visit "/beats/#{beat.id}/like"

      expect(page).to have_content("1 👍")
    end
  end
end
