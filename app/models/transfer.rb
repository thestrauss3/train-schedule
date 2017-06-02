class Transfer < ApplicationRecord
  validates :from_stop_id, :to_stop_id, :transfer_type, presence: true
end
