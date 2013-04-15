class AddPaymentStatusToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :paid, :boolean, default: false
  end
end
