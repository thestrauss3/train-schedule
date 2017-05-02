class UserFavoriteLine < ApplicationRecord
  validates :user, :train_line, null: false
end
