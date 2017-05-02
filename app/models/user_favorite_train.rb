class UserFavoriteTrain < ApplicationRecord
  validates :user, :train, null: false
end
