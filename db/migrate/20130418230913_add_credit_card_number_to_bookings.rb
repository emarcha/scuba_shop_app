class AddCreditCardNumberToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :credit_card_number, :string
  end
end
