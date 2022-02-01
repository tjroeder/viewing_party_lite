# frozen_string_literal: true

FactoryBot.define do
  factory :party do
    sequence(:movie_id)
    sequence(:date) { |n| (rand(n) + 1).years.from_now }
    sequence(:time) { |n| Time.zone.now + n }
    sequence(:img_url) { |n| "/#{n}.jpg" }
    sequence(:movie_title) { Faker::Movie.title }
    sequence(:runtime)

    user
  end
end
