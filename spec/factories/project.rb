# frozen_string_literal: true

# spec/factories/card.rb
FactoryBot.define do
  factory :project do
    name { Faker::Name.name }
    domains { ['e-Virdis.it', 'EMEMORY.IT'] }
  end
end
