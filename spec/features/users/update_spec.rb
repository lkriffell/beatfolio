require 'rails_helper'

RSpec.describe 'user update' do
  before :each do 
    @user = create :user
  end
  
  describe 'happy paths' do
    it 'can be updated' do
      visit "users/#{@user.id}/update"
      fill_in 'user_username', with: 'someone'
      fill_in 'user_email', with: 'someone@email.com'
      fill_in 'user_password', with: '1234'

      click_button('Update')

      expect(current_path).to eq("/users/#{@user.id}")

      @user.reload 

      expect(@user.username).to eq('someone')
      expect(@user.email).to eq('someone@email.com')

      expect(page).to have_content('someone')
    end
  end
  describe 'sad paths' do
    it 'cannot be updated with blank fields' do
      visit "/users/#{@user.id}/update"
      
      fill_in 'user_email', with: ''
      fill_in 'user_username', with: ''

      click_button('Update')

      expect(current_path).to eq("/users/#{@user.id}/update")

      expect(page).to have_content('Your profile information could not be saved')
    end
  end
end
