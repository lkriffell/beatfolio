require 'rails_helper'

RSpec.describe 'beat' do
  before :each do 
    @user = User.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @beat = @user.beats.first
    @beat.beat_tags.create(tag:"cool")
    @beat.beat_tags.create(tag:"nice")
    @beat.beat_tags.create(tag:"dope")
  end

  describe 'happy paths' do
    it 'tags can be removed' do
      
      visit edit_tags_path(@beat)

      expect(page).to have_link('cool')
      expect(page).to have_link('dope')
      expect(page).to have_link('nice')

      click_link('cool')
      click_link('nice')

      expect(page).to_not have_link('cool')
      expect(page).to_not have_link('nice')

      expect(page).to have_link('dope')
    end

    it 'tags can be added' do
      
      visit edit_tags_path(@beat)

      fill_in 'beat_tag_tag', with: 'awesome'

      click_button('Add Tag')

      expect(page).to have_link('awesome')
    end
  end

  describe 'sad paths' do
    it 'cannot add a blank tag' do
      
      visit edit_tags_path(@beat)

      fill_in 'beat_tag_tag', with: ''
      
      click_button('Add Tag')

      expect(Beat.first.beat_tags.include?('')).to eq(false)
    end

    it 'cannot be visited by a logged out user' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)

      visit edit_tags_path(@beat)

      expect(current_path).to eq(login_path)
    end

    it 'cannot be visited by a user who didnt create the beat' do
      @user = User.last
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit edit_tags_path(@beat)

      expect(current_path).to eq(beats_show_path(@beat))
    end
  end
end
