# frozen_string_literal: true

class UserParty < ApplicationRecord
  belongs_to :party
  belongs_to :user

  enum host_status: { guest: 0, host: 1 }

  def self.guests(selected_id)
    where(party_id: selected_id).where(host_status: 0).map do |user_party|
      User.find(user_party.user_id).name
    end
  end
end
