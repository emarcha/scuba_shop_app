class AddNumSeatsToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :num_seats, :integer, default: 1
  end
end
