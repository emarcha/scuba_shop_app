class AddDurationBeforeTypecastToTours < ActiveRecord::Migration
  def change
    add_column :tours, :duration_before_typecast, :string
  end
end
