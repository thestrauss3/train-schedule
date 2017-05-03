class UserFavoriteTrain < ApplicationRecord
  validates :user, :train, null: false

  belongs_to :user
  belongs_to :train
end
