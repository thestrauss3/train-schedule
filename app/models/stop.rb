class Stop < ApplicationRecord
  validates :feed_id, :stop_id, :stop_name, :stop_lat, :stop_lon, presence: true
end
