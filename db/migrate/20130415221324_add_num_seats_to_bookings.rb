class AddNumSeatsToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :num_seats, :integer
  end
end
