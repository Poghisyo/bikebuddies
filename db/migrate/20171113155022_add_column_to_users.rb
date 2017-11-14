class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address, :string
    add_column :users, :name, :string
    add_column :users, :description, :text
    add_column :users, :photo, :string
  end
end
