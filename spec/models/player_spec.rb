require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should belong_to(:group) }
  it { should belong_to(:player_info) }
  it { should validate_presence_of(:score) }
end