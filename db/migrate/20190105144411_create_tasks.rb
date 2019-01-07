class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user,  index: true, null: false
      t.string :value, null: false, index: true
      t.datetime :date_time, null: false, index: true
      t.boolean :is_done, null: false, default: false, index: true

      t.timestamps
    end
  end
end
