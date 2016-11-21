class Pitch < ApplicationRecord
  belongs_to :user
  belongs_to :round
  has_many :votes
  has_many :voters, through: :votes, class_name: "User"

  validates_presence_of :working_title, :description, :user_id, :round_id

  def sum_ranks
    # binding.pry
    votes = self.votes
    return votes.inject(0) { |sum, vote| sum += vote.ranking unless vote.ranking == nil }
  end

end
