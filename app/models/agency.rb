class Agency < ApplicationRecord
  self.primary_key = "agency_id"

  validates :agency_id, :agency_ame, :agency_url, :agency_timezone, presence: true
end
