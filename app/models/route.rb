class Route < ApplicationRecord
  self.primary_key = "route_id"

  validates :name, :route_id, :mode_name, :mode_id, presence: true

  has_many :stations
  has_many :trains
  # has_many :user_favorite_routes
  # has_many :users, through: :user_favorite_routes
end
