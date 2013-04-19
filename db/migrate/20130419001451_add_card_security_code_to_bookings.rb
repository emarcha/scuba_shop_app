class AddCardSecurityCodeToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :card_security_code, :integer
  end
end
