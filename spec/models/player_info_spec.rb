require 'rails_helper'

RSpec.describe PlayerInfo, type: :model do
  it { should have_many(:players).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end