require 'rails_helper'

RSpec.describe 'comments' do
  before :each do 
    @user = User.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @beat = @user.beats.first
  end

  describe 'happy paths' do
    it 'can be created' do
      visit "beats/#{@beat.id}"

      fill_in :description, with: "nice beat dude"
      click_button "Reply"

      expect(Comment.all.size).to eq(1)
    end

    it 'can be shown' do
      visit "beats/#{@beat.id}"

      @beat.comments.each do |tag|
        expect(page).to have_content(comment.description)
      end
    end

    it 'can be deleted by the commenter or beat uploader' do
      visit "beats/#{@beat.id}"

      @beat.comments.each do |tag|
        expect(page).to have_content(comment.description)
      end
    end
  end
end
