class UserFavoriteLine < ApplicationRecord
  validates :user, :line_id, null: false

  belongs_to :user
end
