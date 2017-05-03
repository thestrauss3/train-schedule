class UserFavoriteLine < ApplicationRecord
  validates :user, :train_line, null: false

  belongs_to :user
  belongs_to :train_line
end
