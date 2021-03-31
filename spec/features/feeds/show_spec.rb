require 'rails_helper'

RSpec.describe 'feed show' do
  describe 'happy paths' do
    before :each do 
      @user = User.first
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    it 'shows content the user is following' do      
      visit "/feed"

      expect(page).to have_content('YOURE FOLLOWING ME')
      expect(page).to have_content('hmu')
    end

    it 'does not show content the user is not following' do
      visit "/feed"

      expect(page).to_not have_content('The Dopest Track Ever Made')
      expect(page).to_not have_content('Why arent you following me?')
    end
  end
end
