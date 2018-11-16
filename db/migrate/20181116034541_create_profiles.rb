class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :uid, null: false
      t.integer :provider, null: false, default: 0

      t.timestamps
    end
    add_index :profiles, %i[uid provider]
  end
end
