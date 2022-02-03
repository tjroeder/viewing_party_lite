FactoryBot.define do
  factory :cast do
    data  { {name: Faker::FunnyName.two_word_name, character: Faker::Movies::HarryPotter.character} }
  end
end
