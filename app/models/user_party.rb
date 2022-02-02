# frozen_string_literal: true

class UserParty < ApplicationRecord
  belongs_to :party
  belongs_to :user

  enum host_status: { guest: 0, host: 1 }
end
