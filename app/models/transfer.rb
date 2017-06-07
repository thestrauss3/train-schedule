class Transfer < ApplicationRecord
  validates :feed_id, :from_stop_id, :to_stop_id, :transfer_type, presence: true
end
