class AddReferenceToNikkis < ActiveRecord::Migration[5.2]
  def change
    add_reference :nikkis, :user, index: true, null: false
  end
end
