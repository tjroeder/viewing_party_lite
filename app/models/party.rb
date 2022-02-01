class Party < ApplicationRecord
  belongs_to :user
  has_many :guest_parties
  has_many :users, through: :guest_parties

  validates_presence_of :movie_id, :date, :time, :img_url, :movie_title, :runtime
end
