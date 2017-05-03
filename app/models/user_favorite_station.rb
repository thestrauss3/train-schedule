class UserFavoriteStation < ApplicationRecord
  validates :user, :station, null: false

  belongs_to :user
  belongs_to :station
end
