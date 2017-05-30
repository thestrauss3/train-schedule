class AddModeToTrainLines < ActiveRecord::Migration[5.0]
  def change
    add_column :train_lines, :mode, :string, null: false
  end
end
