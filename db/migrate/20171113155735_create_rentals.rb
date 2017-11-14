class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :total_price
      t.string :status
      # t.references :user, foreign_key: true
      t.references :bike, foreign_key: true
      t.integer :buyer_id

      t.timestamps
    end

    add_foreign_key :rentals, :users, column: :buyer_id
  end
end
