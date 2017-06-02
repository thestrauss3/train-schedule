class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.string :feed_publisher_name, null: false
      t.string :feed_publisher_url, null: false
      t.string :feed_land, null: false
      t.date :feed_start_date
      t.date :feed_end_date
      t.string :feed_version
    end
  end
end
