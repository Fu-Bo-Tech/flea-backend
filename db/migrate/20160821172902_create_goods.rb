class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods do |t|
      t.string :title
      t.text :description
      t.datetime :bidding_time
      t.text :image
      t.timestamps
    end
  end
end
