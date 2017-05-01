class TrainStop < ApplicationRecord
  validates :train_id, presence: true
  validates :station_id, presence: true

  belongs_to :train
  belongs_to :station
end
