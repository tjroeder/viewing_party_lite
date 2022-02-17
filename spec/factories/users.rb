# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::FunnyName.two_word_name }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end
