class AddUserIdToGoods < ActiveRecord::Migration[5.0]
  def change
    add_column :goods, :user_id, :integer, nil: false
    add_index :goods, :user_id
  end
end
