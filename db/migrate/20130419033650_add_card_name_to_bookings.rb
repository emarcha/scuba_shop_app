class AddCardNameToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :card_name, :string
  end
end
