class CreateCalendarDates < ActiveRecord::Migration[5.0]
  def change
    create_table :calendar_dates do |t|
      t.string :service_id, null: false
      t.date :date, null: false
      t.boolean :exception_type, null: false
    end
  end
end
