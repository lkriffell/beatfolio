require 'rails_helper'

RSpec.describe Like, type: :model do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :beat_id }
  it { should belong_to :beat }

  it 'can exist' do
    Like.delete_all
    user = create :user
    user2 = create :user
    beat = user.beats.create(name: 'mac miller type beat')
    beat_tag = beat.beat_tags.create(tag: 'boom bap')
    beat.likes.create(user_id: user2)

    expect(beat.likes.size).to eq(1)
  end
end
