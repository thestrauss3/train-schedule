class FeedLangsIsNotLands < ActiveRecord::Migration[5.0]
  def change
    rename_column :feeds, :feed_land, :feed_lang
  end
end
