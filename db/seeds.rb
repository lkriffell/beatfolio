require 'factory_bot_rails'
require 'faker'

main_user = FactoryBot.create(:user)
follower1 = FactoryBot.create(:user)
follower2 = FactoryBot.create(:user)
follower3 = FactoryBot.create(:user)
follower4 = FactoryBot.create(:user)

main_user.followers.create(follower_id: follower1.id)
main_user.followers.create(follower_id: follower2.id)
main_user.followers.create(follower_id: follower3.id)
main_user.followers.create(follower_id: follower4.id)

beat1 = main_user.beats.create(name:'Mac Miller Type Beat')
beat2 = main_user.beats.create(name:'Hard Trap Beat')

beat1.beat_tags.create(tag: 'chill')
beat1.beat_tags.create(tag: 'boom bap')

beat2.beat_tags.create(tag: 'hard')
beat2.beat_tags.create(tag: 'trap')
