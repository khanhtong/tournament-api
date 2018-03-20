require 'rails_helper'

RSpec.describe Match, type: :model do
  it { should belong_to(:group) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:venue) }
  it { should validate_presence_of(:score_player1) }
  it { should validate_presence_of(:score_player2) }
  it { should validate_presence_of(:player1_id) }
  it { should validate_presence_of(:player2_id) }
end
