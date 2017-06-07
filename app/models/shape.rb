class Shape < ApplicationRecord
  validates :feed_id, :shape_id, :shape_pt_lat, :shape_pt_lon, :shape_pt_sequence, presence: true
end
