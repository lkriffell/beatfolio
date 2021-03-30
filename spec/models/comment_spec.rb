require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :beat_id }
  it { should validate_presence_of :description }
  it { should belong_to :beat }
  it { should belong_to :user }

  it 'can exist' do
    user = create :user
    user2 = create :user
    beat = user.beats.create(name: 'mac miller type beat')
    beat_tag = beat.beat_tags.create(tag: 'boom bap')
    beat.comments.create(user_id: user2.id, description: "Cool beat dude")

    expect(beat.comments.size).to eq(1)
  end
end
