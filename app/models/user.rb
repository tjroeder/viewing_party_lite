# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_parties, dependent: nil
  has_many :parties, through: :user_parties

  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :name, presence: true
end
