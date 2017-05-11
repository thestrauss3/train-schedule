class UserFavoriteTrain < ApplicationRecord
  validates :user, :train_id, :line_id, null: false

  belongs_to :user
  # belongs_to :train
end
