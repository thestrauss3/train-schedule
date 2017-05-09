class FullName < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :name, :string
    remove_column :users, :first_name
    remove_column :users, :last_name
  end

  def down
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    remove_column :users, :name
  end
end
