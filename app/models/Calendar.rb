class Calendar < ApplicationRecord
  validates :service_id, :start_date, :end_date, presence: true
  validates :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, presence: true
end
