FactoryBot.define do
  factory :user, class: 'User' do
    email { Faker::Internet.email }
    username { Faker::Name.name }
    password { '1234' }
  end
end