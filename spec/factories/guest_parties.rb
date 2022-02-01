# frozen_string_literal: true

FactoryBot.define do
  factory :guest_party do
    user
    party
  end
end
