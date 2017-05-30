class ChangeTrainLineToRoute < ActiveRecord::Migration[5.0]
  def change
    rename_table :train_lines, :routes
  end
end
