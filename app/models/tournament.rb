class Tournament < ApplicationRecord
  has_many :groups
  validates_presence_of :name
end
