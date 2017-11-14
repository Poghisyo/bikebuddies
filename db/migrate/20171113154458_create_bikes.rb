class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.integer :price
      t.string :name
      t.string :description
      t.string :location
      t.string :condition
      t.boolean :availability
      t.integer :seller_id

      t.timestamps
    end

    add_foreign_key :bikes, :users, column: :seller_id
  end
end
