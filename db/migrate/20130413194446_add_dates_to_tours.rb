class AddDatesToTours < ActiveRecord::Migration
  def change
    add_column :tours, :tour_date, :Date
  end
end
