class AddExtendedCountToGoods < ActiveRecord::Migration[5.0]
  def change
    add_column :goods, :extended_count, :integer, default: 0
  end
end
