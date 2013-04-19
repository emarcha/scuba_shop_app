class AddCardExpMonthToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :card_exp_month, :integer
  end
end
