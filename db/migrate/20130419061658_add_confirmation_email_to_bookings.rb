class AddConfirmationEmailToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :confirmation_email, :string
  end
end
