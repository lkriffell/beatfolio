require 'factory_bot_rails'
require 'faker'

User.delete_all
Beat.delete_all
BeatTag.delete_all
UserFollow.delete_all

main_user = FactoryBot.create(:user, username: 'Billy Joel', email: 'BillJ@gmail.com')
follower1 = FactoryBot.create(:user)
follower2 = FactoryBot.create(:user)
follower3 = FactoryBot.create(:user)
follower4 = FactoryBot.create(:user)

discover_user = FactoryBot.create(:user)
discover_beat = discover_user.beats.create(name:'The Dopest Track Ever Made', description: 'Why arent you following me?')
discover_beat.beat_tags.create(tag: 'dope')
discover_beat.beat_tags.create(tag: 'track')

feed_user = FactoryBot.create(:user)
feed_beat = feed_user.beats.create(name:'YOURE FOLLOWING ME', description: 'hmu')
main_user.following.create(user_id: feed_user.id)
main_user.likes.create(beat_id: feed_beat.id)

main_user.followers.create(follower_id: follower1.id)
main_user.followers.create(follower_id: follower2.id)
main_user.followers.create(follower_id: follower3.id)
main_user.followers.create(follower_id: follower4.id)

beat1 = main_user.beats.create(name:'Mac Miller Type Beat', description: 'A cool beat I made')
beat2 = main_user.beats.create(name:'Hard Trap Beat', description: "This beat is my favorite beat I've made so far")

beat1.beat_tags.create(tag: 'chill')
beat1.beat_tags.create(tag: 'boom bap')
beat1.beat_tags.create(tag: 'Mac')
beat1.beat_tags.create(tag: 'Miller')

beat2.beat_tags.create(tag: 'hard')
beat2.beat_tags.create(tag: 'trap')
beat2.beat_tags.create(tag: 'Migos')
beat2.beat_tags.create(tag: 'saucy')
