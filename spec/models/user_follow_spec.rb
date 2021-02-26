require 'rails_helper'

RSpec.describe UserFollow, type: :model do
  describe 'UserFollows' do
    it { should validate_presence_of :follower_id }
    it { should validate_presence_of :user_id }

    it { should belong_to :user }

    it 'can exist' do
      user1 = create :user
      user2 = create :user

      follow = UserFollow.create(user_id: user1.id, follower_id: user2.id)

      expect(user1.followers.first).to eq(follow)
      expect(user2.following.first).to eq(follow)
    end
  end
end
