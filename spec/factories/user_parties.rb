# frozen_string_literal: true

FactoryBot.define do
  factory :user_party do
    traits_for_enum(:host_status, %w[guest host])

    user
    party
  end
end
