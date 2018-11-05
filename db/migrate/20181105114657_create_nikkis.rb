class CreateNikkis < ActiveRecord::Migration[5.2]
  def change
    create_table :nikkis do |t|
      t.string :value
      t.datetime :datetime

      t.timestamps
    end
  end
end
