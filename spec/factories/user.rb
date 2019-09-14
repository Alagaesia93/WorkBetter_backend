# frozen_string_literal: true

# spec/factories/card.rb
FactoryBot.define do
  factory :user do
    # full_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
