class Trip < ApplicationRecord
  validates :route_id, :service_id, :trip_id, presence: true
end
