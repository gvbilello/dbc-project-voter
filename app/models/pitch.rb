class Pitch < ApplicationRecord
  belongs_to :user
  belongs_to :round
  has_many :votes
  has_many :voters, through: :votes, class_name: "User"

  validates_presence_of :working_title, :description, :user_id, :round_id
end
