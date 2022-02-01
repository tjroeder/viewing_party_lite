# frozen_string_literal: true

class GuestParty < ApplicationRecord
  belongs_to :party
  belongs_to :user
end
