class User < ApplicationRecord
  has_many :parties
  has_many :guest_parties
  has_many :parties, through: :guest_parties

  validates_presence_of :email, unique: true
  validates_presence_of :name
end
