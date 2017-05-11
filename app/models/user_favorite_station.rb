class UserFavoriteStation < ApplicationRecord
  validates :user, :station_id, :line_id, null: false

  belongs_to :user
  # belongs_to :station
end
