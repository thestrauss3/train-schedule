class FareAttribute < ApplicationRecord
  validates :feed_id, :fare_id, :price, :currency_type, :payment_method, :transfers, presence: true
end
