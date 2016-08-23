class AddDisplaynameToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :displayname, :string
  end
end
