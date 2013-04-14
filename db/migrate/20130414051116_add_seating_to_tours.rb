class AddSeatingToTours < ActiveRecord::Migration
  def change
    add_column :tours, :total_seats, :integer
    add_column :tours, :available_seats, :integer
  end
end
