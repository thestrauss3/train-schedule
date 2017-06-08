class Frequency < ApplicationRecord
  validates :feed_id, :trip_id, :start_time, :end_time, :headway_secs, :exact_times, presence: true
end
