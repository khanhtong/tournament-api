class Player < ApplicationRecord
  belongs_to :group
  belongs_to :player_info
  validates_presence_of :score
end
