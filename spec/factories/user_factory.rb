FactoryBot.define do
  factory :user, class: 'User' do
    email { Faker::Internet.email }
    username { Faker::Name.name }
    image { Faker::Fillmurray.image }
    password { '1234' }
  end
end