class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.references :user,  index: true, null: false
      t.string :value, index: true, null: false
      t.datetime :execute_time, index: true, null: false
      t.boolean :is_finished, index: true, default: false

      t.timestamps
    end
  end
end
