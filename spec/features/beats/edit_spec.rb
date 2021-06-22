require 'rails_helper'

RSpec.describe 'beat' do
  before :each do 
    @user = User.find_by(email: "BillJ@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @beat = @user.beats.first
  end

  describe 'happy paths' do
    it 'can be updated' do
      visit beats_edit_path(@beat)
    
      fill_in 'beat_name', with: 'This cool beat'
      fill_in 'beat_description', with: 'a dope beat'
      
      click_button("Update")

      expect(current_path).to eq("/beats/#{@beat.id}")

      expect(page).to have_content('This cool beat')
      expect(page).to have_content('a dope beat')

      @beat.reload

      expect(@beat.name).to eq('This cool beat')
      expect(@beat.description).to eq('a dope beat')
    end
  end

  describe 'sad paths' do
    it 'cannot be updated as blank' do
      visit beats_edit_path(@beat)
    
      fill_in 'beat_name', with: ''
      fill_in 'beat_description', with: ''
      
      click_button("Update")

      expect(page).to have_content("The beat couldn't be updated. Please try again.")

      expect(current_path).to eq(beats_edit_path(@beat))
    end
  end
end
