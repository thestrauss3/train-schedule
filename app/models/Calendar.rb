class Calendar < ApplicationRecord
  validates :feed_id, :service_id, :start_date, :end_date, presence: true
  validates :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, presence: true
end
