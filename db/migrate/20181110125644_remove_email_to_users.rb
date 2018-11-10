class RemoveEmailToUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :email, :string
  end

  # 変更前の状態
  def down
    change_column :users, :email, :string, null: false, default: ""
  end
end
