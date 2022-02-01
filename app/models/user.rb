# frozen_string_literal: true

class User < ApplicationRecord
  has_many :parties, dependent: nil
  has_many :guest_parties, dependent: nil
  has_many :parties, through: :guest_parties

  validates :email, presence: { unique: true }
  validates :name, presence: true
end
