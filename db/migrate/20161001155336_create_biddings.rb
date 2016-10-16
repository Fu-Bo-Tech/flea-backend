class CreateBiddings < ActiveRecord::Migration[5.0]
  def change
    create_table :biddings do |t|
      t.integer :user_id, null: false
      t.integer :good_id, null: false
      t.integer :amount
      t.text :trash_word
      t.timestamps
    end
    add_index :biddings, :user_id
    add_index :biddings, :good_id
  end
end
