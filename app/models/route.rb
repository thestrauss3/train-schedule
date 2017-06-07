class Route < ApplicationRecord
  self.primary_key = "route_id"

  validates :feed_id, :route_id, :route_type, presence: true
  validates :route_short_name, length: { in: 0..255, allow_nil: false }
  validates :route_long_name, length: { in: 0..255, allow_nil: false }
  validate :name_is_present

  private

  def name_is_present
    if self.route_short_name.empty? && self.route_long_name.empty?
      self.errors.add :base, 'Route must have a name'
    end
  end
end
