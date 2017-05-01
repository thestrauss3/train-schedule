class TrainLine < ApplicationRecord
  validates :name, presence: true

  has_many :stations
  has_many :trains
end
