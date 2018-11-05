class CreateNikkis < ActiveRecord::Migration[5.2]
  def change
    create_table :nikkis do |t|
      t.string :value, index: true, null: false
      t.datetime :datetime, index: true, null: false

      t.timestamps
    end
  end
end
