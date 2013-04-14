class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :tour_id

      t.timestamps
    end
    add_index :bookings, [:tour_id, :created_at]
  end
end
