class Stop < ApplicationRecord
  validates :stop_id, :stop_name, :stop_lat, :stop_lon, presence: true
end
