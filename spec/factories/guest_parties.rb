# frozen_string_literal: true

FactoryBot.define do
  factory :guest_party do
    traits_for_enum(:host_status, %w[guest host])
    
    user
    party
  end
end
