class Vote < ApplicationRecord
  belongs_to :voter, class_name: "User", foreign_key: :user_id
  belongs_to :pitch
  belongs_to :round

  validates_presence_of :user_id, :pitch_id, :round_id
  # validates_uniqueness_of :user_id, scope: [:pitch_id, :round_id]
  # validates_uniqueness_of :ranking, scope: [:user_id, :pitch_id, :round_id]
end
