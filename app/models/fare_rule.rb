class FareRule < ApplicationRecord
  validates :fare_id, presence: true
end
