FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    sequence(:movie_id)
    genres { { 'a' => 'b' } }
    sequence(:runtime)
    sequence(:vote_average)
    summary { Faker::Movie.quote}

    cast
    review
  end
end
