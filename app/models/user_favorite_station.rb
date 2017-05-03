class UserFavoriteStation < ApplicationRecord
  validates :user, :station, null: false
end
