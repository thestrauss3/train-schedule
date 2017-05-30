class TrainLine < ApplicationRecord
  validates :name, presence: true
  validates :mode, presence: true

  has_many :stations
  has_many :trains
  # has_many :user_favorite_lines
  # has_many :users, through: :user_favorite_lines
end
