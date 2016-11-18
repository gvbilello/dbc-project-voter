class Vote < ApplicationRecord
  references :user
  references :pitch
  references :round

  validates_presence_of :user_id, :pitch_id, :round_id
  validates_uniqueness_of :user_id, scope: [:pitch_id, :round_id]
  validates_uniqueness_of :ranking, scope: [:user_id, :pitch_id, :round_id]
end
