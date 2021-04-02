require 'rails_helper'

RSpec.describe 'beat' do
  before :each do 
    @user = User.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @beat = @user.beats.first
  end

  describe 'happy paths' do
    it 'can be shown' do
      visit "beats/#{@beat.id}"

      expect(page).to have_content(@beat.name)
      expect(page).to have_content(@beat.description)
      @beat.beat_tags.each do |tag|
        expect(page).to have_content(tag.tag)
      end
    end
  end

  describe 'sad paths' do
    it 'cannot show a beat that doesnt exist' do
      visit "beats/2345123"
      
      expect(page).to have_content("That beat doesn't exist")
    end
  end
end
