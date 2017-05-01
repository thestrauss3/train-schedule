class Station < ApplicationRecord
  validates :name, :train_line_id, presence: true
  validates :has_wifi, inclusion: { in: [true, false, nil] }

  belongs_to :train_line
  has_many :train_stops
  has_many :trains, through: :train_stops
end
