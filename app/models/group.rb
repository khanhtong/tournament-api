class Group < ApplicationRecord
  belongs_to :tournament
  has_many :players, dependent: :destroy
  has_many :matches, dependent: :destroy
  validates_presence_of :name
end
