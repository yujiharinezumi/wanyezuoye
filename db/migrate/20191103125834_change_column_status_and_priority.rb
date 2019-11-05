class ChangeColumnStatusAndPriority < ActiveRecord::Migration[5.2]
  def change
      change_column :tasks, :status, :integer, null: false
      change_column :tasks, :priority, :integer, null: false
  end
end
