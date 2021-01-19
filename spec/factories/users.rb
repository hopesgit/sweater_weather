FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { Faker::String.random }
    api_key { Faker::Number.hexadecimal(digits: 16) }
  end
end
