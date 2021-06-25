require 'rails_helper'

RSpec.describe 'beat' do
  describe 'happy paths' do
    it 'can be created' do
      Beat.delete_all
      user = User.find_by(email: "BillJ@gmail.com")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit '/beats/new'

      fill_in 'beat_name', with: 'Dope Beat'
      fill_in 'beat_tags', with: 'cool, hip, hop, rap'
      fill_in 'beat_description', with: 'a dope beat I made'

      click_button('Save Beat')

      expect(Beat.all.size).to eq(1)
      beat = Beat.last

      expect(current_path).to eq("/beats/#{beat.id}")

      expect(beat.description).to eq('a dope beat I made')

      expect(beat.beat_tags.size).to eq(4)
      expect(beat.beat_tags[0].tag).to eq('cool')
      expect(beat.beat_tags[1].tag).to eq('hip')
      expect(beat.beat_tags[2].tag).to eq('hop')
      expect(beat.beat_tags[3].tag).to eq('rap')
    end
  end
  describe 'sad paths' do
    it 'cannot be created without being logged in' do
      visit '/beats/new'

      expect(current_path).to eq("/login")
    end

    it 'cannot be created without name' do
      user = User.find_by(email: "BillJ@gmail.com")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/beats/new'

      fill_in 'beat_tags', with: 'cool, hip, hop, rap'

      click_button('Save Beat')

      expect(current_path).to eq("/beats/new")

      expect(page).to have_content("Something went wrong, did you fill out all fields?")
    end
  end
end
