require 'rails_helper'

RSpec.describe 'beat' do
  before :each do 
    Beat.first.beat_tags.create(tag:"cool")
    Beat.first.beat_tags.create(tag:"dope")
    Beat.first.beat_tags.create(tag:"nice")
    
    visit login_path
  
    fill_in 'email', with: 'BillJ@gmail.com'
    fill_in 'password', with: '1234'
  
    click_button('Log In')
  end

  describe 'happy paths' do
    it 'tags can be removed' do
      
      visit "/beats/#{Beat.first.id}/tags/edit"

      expect(page).to have_link('cool')
      expect(page).to have_link('dope')
      expect(page).to have_link('nice')

      click_link('cool')
      click_link('dope')
      click_link('nice')

      expect(page).to_not have_link('cool')
      expect(page).to_not have_link('dope')
      expect(page).to_not have_link('nice')
    end

    it 'tags can be added' do
      
      visit "/beats/#{Beat.first.id}/tags/edit"

      fill_in 'beat_tag_tag', with: 'awesome'

      click_button('Add Tag')

      expect(page).to have_link('awesome')
    end
  end

  describe 'sad paths' do
    it 'cannot add a blank tag' do
      
      visit "/beats/#{Beat.first.id}/tags/edit"

      fill_in 'beat_tag_tag', with: ''
      
      click_button('Add Tag')

      expect(page).to_not have_link('awesome')
    end
  end
end
