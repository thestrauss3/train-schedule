class AddFeedIdToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :agencies, :feed_id, :integer, null: false
    add_column :calendar_dates, :feed_id, :integer, null: false
    add_column :calendars, :feed_id, :integer, null: false
    add_column :fare_attributes, :feed_id, :integer, null: false
    add_column :fare_rules, :feed_id, :integer, null: false
    add_column :frequencies, :feed_id, :integer, null: false
    add_column :routes, :feed_id, :integer, null: false
    add_column :shapes, :feed_id, :integer, null: false
    add_column :stations, :feed_id, :integer, null: false
    add_column :stop_times, :feed_id, :integer, null: false
    add_column :stops, :feed_id, :integer, null: false
    add_column :transfers, :feed_id, :integer, null: false
    add_column :trips, :feed_id, :integer, null: false
  end
end
