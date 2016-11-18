class User < ApplicationRecord
  has_secure_password

  has_many :votes
  has_many :pitches
  has_many :rounds, through: :pitches
  belongs_to :cohort

  validates_presence_of :name, :username, :email, :cohort
  validates_uniqueness_of :username, :email
  validates :username, length: {maximum: 30}
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :password, length: {minimum: 8, maximum: 30}
end
