require 'rails_helper'

RSpec.describe Tournament, type: :model do
  # Association test
  # ensure Tounrnament model has a 1:m relationship with the Item model
  it { should have_many(:groups).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end