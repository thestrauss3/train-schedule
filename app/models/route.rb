class Route < ApplicationRecord
  self.primary_key = "route_id"

  validates :route_id, :route_type, :city, :authority, presence: true
  validates :short_name, length: { in: 0..255, allow_nil: false }
  validates :long_name, length: { in: 0..255, allow_nil: false }
  validate :name_is_present

  has_many :stations
  has_many :trains
  # has_many :user_favorite_routes
  # has_many :users, through: :user_favorite_routes

  private
  
  def name_is_present
    if self.short_name.empty? && self.long_name.empty?
      self.errors.add :base, 'Route must have a name'
    end
  end
end
