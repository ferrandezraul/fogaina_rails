class AddPriceToRefineryBread < ActiveRecord::Migration
  def change
    add_column :refinery_breads, :price, :decimal, precision: 5, scale: 2
    add_column :refinery_breads, :available_days, :string
  end
end
