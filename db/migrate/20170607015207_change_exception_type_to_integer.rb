class ChangeExceptionTypeToInteger < ActiveRecord::Migration[5.0]
  def up
    change_column :calendar_dates, :exception_type, :integer, null: false, using: 'case when exception_type then 1 else 2 end'
  end
  def down
    change_column :calendar_dates, :exception_type, :boolean, null: false, using: 'case when exception_type = 1 then true else false end'
  end
end
