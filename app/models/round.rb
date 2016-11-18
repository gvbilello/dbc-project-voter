class Round < ApplicationRecord
  has_many :votes
  has_many :pitches
  has_many :voters, through: :pitches, class_name: "User"

  validates_presence_of :name
end
