class Route < ApplicationRecord
  self.primary_key = "route_id"

  validates :name, presence: true
  validates :mode, presence: true

  has_many :stations
  has_many :trains
  # has_many :user_favorite_routes
  # has_many :users, through: :user_favorite_routes
end
