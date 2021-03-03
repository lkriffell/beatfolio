require 'rails_helper'

RSpec.describe BeatTag, type: :model do
  it { should validate_presence_of :tag }
  it { should validate_presence_of :beat_id }
  it { should belong_to :beat }

  it 'can exist' do
    BeatTag.delete_all
    user = create :user
    beat = user.beats.create(name: 'mac miller type beat')
    beat_tag = beat.beat_tags.create(tag: 'boom bap')

    expect(BeatTag.all.size).to eq(1)
    expect(BeatTag.first).to eq(beat_tag)
    expect(beat.beat_tags.first).to eq(beat_tag)
  end
end
