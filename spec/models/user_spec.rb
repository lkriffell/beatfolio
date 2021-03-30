require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do 
    User.delete_all
    @user = create :user
  end

  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :password }
  it { should have_many :beats }
  it { should have_many :following }
  it { should have_many :followers }
  it { should have_many :comments }
  it { should have_many :likes }

  describe 'happy paths' do
    it 'can exist' do
      expect(User.all.size).to eq(1)
      created_user = User.all.first

      expect(@user.username).to eq(created_user.username)
      expect(@user.email).to eq(created_user.email)
      expect(@user.image).to eq(created_user.image)
    end
  end
end
