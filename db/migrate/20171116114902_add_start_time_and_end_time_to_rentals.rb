class AddStartTimeAndEndTimeToRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :start_time, :time
    add_column :rentals, :end_time, :time
  end
end
