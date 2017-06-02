class StopTime < ApplicationRecord
  validates :trip_id, :stop_id, :stop_sequence, presence: true
end
