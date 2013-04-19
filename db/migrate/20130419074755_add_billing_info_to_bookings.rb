class AddBillingInfoToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :billing_address, :string
    add_column :bookings, :billing_zipcode, :string
    add_column :bookings, :billing_state, :string
  end
end
