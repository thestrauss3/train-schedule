class CreateAgencies < ActiveRecord::Migration[5.0]
  def change
    create_table :agencies do |t|
      t.integer :agency_id, null: false, default: 0
      t.string :name, null: false
      t.string :url, null: false
      t.string :timezone, null: false
      t.string :lang
      t.string :phone
      t.string :fare_url
      t.string :email
    end
  end
end
