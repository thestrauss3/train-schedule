class Agency < ApplicationRecord
  self.primary_key = "agency_id"

  validates :feed_id, :agency_id, :agency_ame, :agency_url, :agency_timezone, presence: true
end
