class StopTime < ApplicationRecord
  validates :feed_id, :trip_id, :stop_id, :stop_sequence, presence: true
end
