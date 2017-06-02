class Frequency < ApplicationRecord
  validates :trip_id, :start_time, :end_time, :headway_secs, :exact_times, presence: true
end
