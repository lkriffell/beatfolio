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

      click_button('Save Beat')

      expect(Beat.all.size).to eq(1)
      beat = Beat.last

      expect(current_path).to eq("/beats/#{beat.id}")

      expect(beat.beat_tags.size).to eq(4)
      expect(beat.beat_tags[0].tag).to eq('cool')
      expect(beat.beat_tags[1].tag).to eq('hip')
      expect(beat.beat_tags[2].tag).to eq('hop')
      expect(beat.beat_tags[3].tag).to eq('rap')
    end
    it 'can be seen by logged out users' do
      click_link "Log Out"
      user = User.first
      beat = user.beats.create(name: "cool beat")
      visit "beats/#{beat.id}"
      
      expect(page).to have_content("cool beat")
      expect(page).to have_content(user.username)

      expect(current_path).to eq("/beats/#{beat.id}")
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

    # it 'cannot be registered without email' do
    #   visit users_new_path

    #   fill_in 'user_username', with: 'someone'
    #   fill_in 'user_password', with: '1234'
    #   fill_in 'user_image', with: 'https://www.fillmurray.com/200/200'

    #   click_button('Save User')

    #   expect(current_path).to eq("/users/new")

    #   expect(page).to have_content("Something went wrong, did you fill out all fields?")
    # end

    # it 'cannot be registered without image' do
    #   visit users_new_path

    #   fill_in 'user_username', with: 'someone'
    #   fill_in 'user_password', with: '1234'
    #   fill_in 'user_email', with: 'someone@email.com'

    #   click_button('Save User')

    #   expect(current_path).to eq("/users/new")

    #   expect(page).to have_content("Something went wrong, did you fill out all fields?")
    # end
  end
end