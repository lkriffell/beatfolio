require 'rails_helper'

RSpec.describe 'beat' do
  before :each do 
    visit login_path
  
    fill_in 'email', with: 'BillJ@gmail.com'
    fill_in 'password', with: '1234'
  
    click_button('Log In')

    @user = User.find_by(email: "BillJ@gmail.com")
    @beat = @user.beats.first
  end

  describe 'happy paths' do
    it 'can be updated' do
      visit "beats/#{@beat.id}/update"
    
      fill_in 'beat_image', with: 'This pic'
      fill_in 'beat_name', with: 'This cool beat'
      fill_in 'beat_description', with: 'a dope beat'
      
      click_button("Update")

      expect(current_path).to eq("/beats/#{@beat.id}")

      expect(page).to have_content('This cool beat')
      expect(page).to have_content('a dope beat')

      @beat.reload

      expect(@beat.name).to eq('This cool beat')
      expect(@beat.image).to eq('This pic')
      expect(@beat.description).to eq('a dope beat')
    end
  end

  describe 'sad paths' do
    it 'cannot be updated as blank' do
      visit "beats/#{@beat.id}/update"
    
      fill_in 'beat_image', with: ''
      fill_in 'beat_name', with: ''
      fill_in 'beat_description', with: ''
      
      click_button("Update")

      expect(current_path).to eq("/beats/#{@beat.id}/update")
    end
  end
end
