class AddEventIdToGoods < ActiveRecord::Migration[5.0]
  def change
    add_column :goods, :event_id, :integer, nil: false
    add_index :goods, :event_id
  end
end
