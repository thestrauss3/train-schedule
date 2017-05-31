class InRoutesChangeModeToModeName < ActiveRecord::Migration[5.0]
  def change
    rename_column :routes, :mode, :mode_name
  end
end
