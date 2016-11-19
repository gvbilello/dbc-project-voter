class Pitch < ApplicationRecord
  belongs_to :user
  belongs_to :round
  has_many :votes
  has_many :voters, through: :votes, class_name: "User"

  validates_presence_of :working_title, :description, :user_id, :round_id
  #
  def total_votes
    self.votes.length
  end
  #
  # def sort_by_votes
  #   self.sort{|a,b| a.total_votes <=> b.total_votes}.last
  # end

  def mostVoted
    self.sort_by do |pitch|
      self.map do |pitch|
        pitch.votes.count
      end.reduce(0, :+)
    end
  end
end
