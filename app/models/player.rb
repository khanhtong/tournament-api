class Player < ApplicationRecord
  belongs_to :group
  belongs_to :player_info
  has_many :matches
  validates_presence_of :score
end
