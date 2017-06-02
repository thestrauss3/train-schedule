class DefaultThatAgencyId < ActiveRecord::Migration[5.0]
  def up
    change_column :routes, :agency_id, :integer, default: 0, null: false
  end
  def down
    change_column :routes, :agency_id, :integer
  end
end
