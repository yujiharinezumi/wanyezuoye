class AddTaskRefToStatuses < ActiveRecord::Migration[5.2]
  def change
    add_reference :statuses, :task, foreign_key: true
  end
end
