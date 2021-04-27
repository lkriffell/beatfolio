require 'rails_helper'

RSpec.describe Beat, type: :model do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :name }
  it { should belong_to :user }
  it { should have_many :beat_tags }

  it 'can exist' do
    Beat.delete_all
    user = create :user
    beat = user.beats.create(name: 'mac miller type beat')

    expect(Beat.all.size).to eq(1)
    expect(Beat.first).to eq(beat)
    expect(user.beats.first).to eq(beat)
  end

  describe 'model methods' do
    it 'related_beats finds beats based on tags' do
      Beat.delete_all
      user = create :user
      create :user, username: "miller"
      beat_one = user.beats.create(name: 'mac miller type beat')
      beat_two = user.beats.create(name: 'mac miller type beat num two')
      beat_one.beat_tags.create(tag: "mac")
      beat_one.beat_tags.create(tag: "miller")

      beat_two.beat_tags.create(tag: "mac")

      beats = Beat.related_beats("mac miller")

      expect(beats["mac"]).to include(beat_one)
      expect(beats["mac"]).to include(beat_two)

      expect(beats["miller"]).to include(beat_one)
      expect(beats["miller"]).to_not include(beat_two)
    end
  end
end
