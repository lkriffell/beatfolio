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
end
