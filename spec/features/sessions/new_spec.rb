require 'rails_helper'

RSpec.describe 'session' do
  describe 'happy paths' do
    it 'can be logged in and out' do
      visit login_path

      fill_in 'email', with: 'BillJ@gmail.com'
      fill_in 'password', with: '1234'

      click_button('Log In')

      expect(current_path).to eq('/')
      expect(page).to have_content("Welcome, Billy Joel")
      expect(page).to have_link("Billy Joel")
      
      click_link("Log Out")
      
      expect(current_path).to eq('/')
      expect(page).to have_link("Log In")
    end
  end
  describe 'sad paths' do
    it 'redirects back to form when not filled out correctly' do
      visit login_path

      fill_in 'email', with: 'BillJ@gmail.com'
      fill_in 'password', with: 'WRONG'

      click_button('Log In')

      expect(current_path).to eq('/login')
      expect(page).to have_content('Your email or password was incorrect!')
    end

    it 'displays message when logged in user visits login path' do
      visit login_path

      fill_in 'email', with: 'BillJ@gmail.com'
      fill_in 'password', with: '1234'

      click_button('Log In')

      visit login_path
      expect(page).to have_content('You are already logged in!')
    end
  end
end