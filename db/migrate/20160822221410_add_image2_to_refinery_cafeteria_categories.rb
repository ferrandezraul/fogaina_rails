class AddImage2ToRefineryCafeteriaCategories < ActiveRecord::Migration
  def change
    add_column :refinery_cafeteria_categories, :image2, :integer
    add_column :refinery_cafeteria_categories, :image3, :integer
  end
end
