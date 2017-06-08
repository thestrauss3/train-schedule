class CalendarDate < ApplicationRecord
  validates :feed_id, :service_id, :date, :exception_type, presence: true
end
