require 'rails_helper'

RSpec.describe 'beat' do
  before :each do 
    Beat.delete_all
    visit login_path
  
    fill_in 'email', with: 'BillJ@gmail.com'
    fill_in 'password', with: '1234'
  
    click_button('Log In')
  end

  describe 'happy paths' do
    it 'can be created' do
      
      visit '/beats/new'

      fill_in 'beat_name', with: 'Dope Beat'
      fill_in 'beat_image', with: 'This pic'
      fill_in 'beat_tags', with: 'cool, hip, hop, rap'
      fill_in 'beat_description', with: 'a dope beat I made'

      click_button('Save Beat')

      expect(Beat.all.size).to eq(1)
      beat = Beat.last

      expect(current_path).to eq("/beats/#{beat.id}")

      expect(beat.description).to eq('a dope beat I made')
      expect(beat.image).to eq('This pic')

      expect(beat.beat_tags.size).to eq(4)
      expect(beat.beat_tags[0].tag).to eq('cool')
      expect(beat.beat_tags[1].tag).to eq('hip')
      expect(beat.beat_tags[2].tag).to eq('hop')
      expect(beat.beat_tags[3].tag).to eq('rap')
    end
  end
  describe 'sad paths' do
    it 'cannot be created without being logged in' do
      click_link "Log Out"

      visit '/beats/new'

      expect(current_path).to eq("/login")
    end

    it 'cannot be created without name' do
      visit '/beats/new'

      fill_in 'beat_image', with: 'This pic'
      fill_in 'beat_tags', with: 'cool, hip, hop, rap'

      click_button('Save Beat')

      expect(current_path).to eq("/beats/new")

      expect(page).to have_content("Something went wrong, did you fill out all fields?")
    end
  end
end
