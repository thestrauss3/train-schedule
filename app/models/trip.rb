class Trip < ApplicationRecord
  validates :feed_id, :route_id, :service_id, :trip_id, presence: true
end
