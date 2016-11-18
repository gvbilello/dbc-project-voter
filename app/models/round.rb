class Round < ApplicationRecord
  references :user
  references :pitch
  has_many :votes

  validates_presence_of :name, :user_id, :pitch_id
end
