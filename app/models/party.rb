# frozen_string_literal: true

class Party < ApplicationRecord
  has_many :user_parties, dependent: nil
  has_many :users, through: :user_parties

  validates :movie_id, :date, :time, :img_url, :movie_title, :runtime, :duration, presence: true

end
