require 'rails_helper'

RSpec.describe 'like' do
  before :each do 
    visit login_path
  
    fill_in 'email', with: 'BillJ@gmail.com'
    fill_in 'password', with: '1234'
  
    click_button('Log In')
  end

  describe 'happy paths' do
    it 'can be liked and unliked' do
      beat = Beat.first
      
      visit "/beats/#{beat.id}"

      expect(Like.all.size).to eq(0)

      click_button "0 👍"

      expect(Like.all.size).to eq(1)
      expect(beat.likes.size).to eq(1)

      expect(page).to have_content("1 👍")

      click_button "1 👍"

      expect(Like.all.size).to eq(0)
      expect(beat.likes.size).to eq(0)
    end
  end
  describe 'sad paths' do
    it "cant be liked twice" do
      beat = Beat.first
      
      visit "/beats/#{beat.id}"

      expect(Like.all.size).to eq(0)

      click_button "0 👍"
      click_button "1 👍"

      expect(Like.all.size).to eq(0)
    end
  end
end
