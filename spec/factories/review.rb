FactoryBot.define do
  factory :review do
    author { Faker::FunnyName.two_word_name }
    content { Faker::Movies::HarryPotter.quote }
  end
end
