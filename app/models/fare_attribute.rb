class FareAttribute < ApplicationRecord
  validates :fare_id, :price, :currency_type, :payment_method, :transfers, presence: true
end
