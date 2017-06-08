class FareRule < ApplicationRecord
  validates :feed_id, :fare_id, presence: true
end
