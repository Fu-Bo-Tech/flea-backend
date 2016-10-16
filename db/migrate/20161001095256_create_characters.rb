class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.integer :user_id
      t.string :name
      t.text :image
      t.timestamps
    end
    add_index :characters, :user_id, unique: true
  end
end
