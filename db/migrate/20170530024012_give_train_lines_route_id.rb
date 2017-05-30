class GiveTrainLinesRouteId < ActiveRecord::Migration[5.0]
  def change
    add_column :train_lines, :route_id, :string, null: false
  end
end
