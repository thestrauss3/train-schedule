class CalendarDate < ApplicationRecord
  validates :service_id, :date, :exception_type, presence: true
end
