class AddDetailsToTours < ActiveRecord::Migration
  def change
    add_column :tours, :total_seats, :integer
    add_column :tours, :available_seats, :integer
    add_column :tours, :price, :Money
  end
end
