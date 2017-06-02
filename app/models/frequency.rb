class Feed < ApplicationRecord
  validates :trip_id, :start_time, :end_time, :headway_secs, presence: true
end
