require 'rails_helper'

RSpec.describe 'user show' do
  describe 'happy paths' do
    it 'can be shown' do
      visit '/users/1'

      expect(page).to have_content("Billy Joel")
      expect(page).to have_content("Followers: 4")
      expect(page).to have_content("Following: 0")
      expect(page).to have_content("Beats")
    end
  end
  describe 'sad paths' do
    # it 'cannot be registered without username' do
    #   visit users_new_path
      
    #   fill_in 'user_email', with: 'someone@email.com'
    #   fill_in 'user_password', with: '1234'
    #   fill_in 'user_image', with: 'https://www.fillmurray.com/200/200'

    #   click_button('Save User')

    #   expect(current_path).to eq("/users/new")

    #   expect(page).to have_content("Something went wrong, did you fill out all fields?")
    # end

    # it 'cannot be registered without password' do
    #   visit users_new_path

    #   fill_in 'user_username', with: 'someone'
    #   fill_in 'user_email', with: 'someone@email.com'
    #   fill_in 'user_image', with: 'https://www.fillmurray.com/200/200'

    #   click_button('Save User')

    #   expect(current_path).to eq("/users/new")

    #   expect(page).to have_content("Something went wrong, did you fill out all fields?")
    # end

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
