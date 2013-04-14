class AddPricingToTours < ActiveRecord::Migration
  def change
    add_money :tours, :price
  end
end
