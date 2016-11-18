class Pitch < ApplicationRecord
  has_many :rounds
  has_one :user, through: :rounds
  has_many :votes

  validates_presence_of :working_title, :description
end
