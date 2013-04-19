class AddCardExpYearToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :card_exp_year, :string
  end
end
