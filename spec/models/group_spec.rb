require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should belong_to(:tournament) }

  it { should have_many(:matches).dependent(:destroy) }
  it { should have_many(:players).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end