class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title
      t.date   :tour_date

      t.timestamps
    end
  end
end
