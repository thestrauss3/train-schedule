class Train < ApplicationRecord
  validates :train_num, :route_id, presence: true
  validates :train_num, uniqueness: true
  validates :inbound, inclusion: { in: [true, false] }

  belongs_to :route
  has_many :train_stops
  has_many :stations, through: :train_stops
  # has_many :user_favorite_trains
  # has_many :users, through: :user_favorite_trains
end
