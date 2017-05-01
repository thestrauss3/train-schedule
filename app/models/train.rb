class Train < ApplicationRecord
  validates :train_num, :train_line_id, presence: true
  validates :train_num, uniqueness: true
  validates :inbound, inclusion: { in: [true, false] }

  belongs_to :train_line
  has_many :train_stops
  has_many :stations, through: :train_stops
end
