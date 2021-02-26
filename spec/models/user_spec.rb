require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do 
    @user = create :user
  end

  describe 'user' do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :username }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should have_many :beats }
    it { should have_many :following }
    it { should have_many :followers }

    describe 'happy paths' do
      it 'can exist' do
        expect(User.all.size).to eq(1)
        created_user = User.all.first

        expect(@user.username).to eq(created_user.username)
        expect(@user.email).to eq(created_user.email)
        expect(@user.image).to eq(created_user.image)
      end
    end

    describe 'sad paths' do
      # it 'cannot be created with non unique username' do 
      #   failed_user = create :user, username: @user.username
      #   require 'pry'; binding.pry
      # end
    end
  end
end
