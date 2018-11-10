class CreateOmniauthProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :omniauth_profiles do |t|
      t.references :user, foreign_key: true
      t.string :uid, index: true, null: false
      t.integer :provider, index: true, null: false, default: 0
      t.string :name, index: true, null: false
      t.string :image, index: true
      t.string :description, index: true
      t.string :email, index: true
      t.string :token, index: true, null: false
      t.string :refresh_token, index: true, null: false

      t.timestamps
    end
  end
end
