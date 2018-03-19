class Match < ApplicationRecord
  belongs_to :group
  belongs_to :player, :class_name => 'Player', :foreign_key => 'player1_id', :validate => true
  belongs_to :player, :class_name => 'Player', :foreign_key => 'player2_id', :validate => true
  validates_presence_of :name, :venue, :score_player1, :score_player2, :player1_id, :player2_id
end
