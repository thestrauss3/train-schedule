class Calendar < ApplicationRecord
  validates :service_id,
            :monday,
            :tuesday,
            :wednesday,
            :thursday,
            :friday,
            :saturday,
            :sunday,
            :start_date,
            :end_date, presence: true
end
