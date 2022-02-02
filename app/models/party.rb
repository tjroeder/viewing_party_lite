# frozen_string_literal: true

class Party < ApplicationRecord
  has_many :guest_parties, dependent: nil
  has_many :users, through: :guest_parties

  validates :movie_id, :date, :time, :img_url, :movie_title, :runtime, presence: true
end
