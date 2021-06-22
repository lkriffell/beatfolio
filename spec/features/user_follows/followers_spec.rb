require 'rails_helper'

RSpec.describe 'follows' do
  before :each do 
    @user = User.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe 'happy paths' do
    it 'can shown followers' do  
      visit "/users/#{@user.id}/followers"
      @user.followers.each do |follower|
        expect(page).to have_content(follower.user.username)
        expect(page).to have_content(follower.created_at.strftime("%B %d, %Y"))
      end
    end
    it 'can shown following' do
      visit "/users/#{@user.id}/following"
      @user.following.each do |following|
        expect(page).to have_content(following.user.username)
        expect(page).to have_content(following.created_at.strftime("%B %d, %Y"))
      end
    end
  end
end
