class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :Waiting
      t.string :Working
      t.string :Completed

      t.timestamps
    end
  end
end
