require 'rails_helper'

RSpec.describe 'user' do
  describe 'happy paths' do
    it 'can be registered' do
      visit users_new_path
      fill_in 'user_username', with: 'someone'
      fill_in 'user_email', with: 'someone@email.com'
      fill_in 'user_password', with: '1234'
      fill_in 'user_image', with: 'https://www.fillmurray.com/200/200'

      click_button('Save User')

      expect(User.all.size).to eq(1)

      user = User.first

      expect(user.username).to eq('someone')
      expect(user.email).to eq('someone@email.com')
      expect(user.image).to eq('https://www.fillmurray.com/200/200')

      expect(current_path).to eq("/users/#{user.id}")
    end
  end
  describe 'sad paths' do
    it 'cannot be registered without username' do
      visit users_new_path
      
      fill_in 'user_email', with: 'someone@email.com'
      fill_in 'user_password', with: '1234'
      fill_in 'user_image', with: 'https://www.fillmurray.com/200/200'

      click_button('Save User')

      expect(current_path).to eq("/users/new")

      expect(page).to have_content("Something went wrong, did you fill out all fields?")
    end

    it 'cannot be registered without password' do
      visit users_new_path

      fill_in 'user_username', with: 'someone'
      fill_in 'user_email', with: 'someone@email.com'
      fill_in 'user_image', with: 'https://www.fillmurray.com/200/200'

      click_button('Save User')

      expect(current_path).to eq("/users/new")

      expect(page).to have_content("Something went wrong, did you fill out all fields?")
    end

    it 'cannot be registered without email' do
      visit users_new_path

      fill_in 'user_username', with: 'someone'
      fill_in 'user_password', with: '1234'
      fill_in 'user_image', with: 'https://www.fillmurray.com/200/200'

      click_button('Save User')

      expect(current_path).to eq("/users/new")

      expect(page).to have_content("Something went wrong, did you fill out all fields?")
    end

    it 'cannot be registered without image' do
      visit users_new_path

      fill_in 'user_username', with: 'someone'
      fill_in 'user_password', with: '1234'
      fill_in 'user_email', with: 'someone@email.com'

      click_button('Save User')

      expect(current_path).to eq("/users/new")

      expect(page).to have_content("Something went wrong, did you fill out all fields?")
    end
  end
end
