class UserFavoriteRoute < ApplicationRecord
  validates :user, :route_id, null: false

  belongs_to :user
end
