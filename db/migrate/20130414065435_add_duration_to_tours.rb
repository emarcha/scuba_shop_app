class AddDurationToTours < ActiveRecord::Migration
  def change
    add_column :tours, :duration, :integer
  end
end
