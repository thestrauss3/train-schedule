class Feed < ApplicationRecord
  validates :feed_publisher_name, :feed_publisher_url, :feed_lang, presence: true
  validate :feed_date_range

  private

  def feed_date_range
    # ensure feed_start_date < feed_end_date
  end
end
