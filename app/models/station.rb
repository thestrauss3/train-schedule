class Station < ApplicationRecord
  validates :stop_name, :stop_order, :stop_id, :route_id, presence: true

  belongs_to :route
  has_many :train_stops
  has_many :trains, through: :train_stops
  # has_many :user_favorite_stations
  # has_many :users, through: :user_favorite_stations
end
