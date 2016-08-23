class AddImage2ToRefineryCafeteriaCategories < ActiveRecord::Migration
  def change
    add_column :refinery_cafeteria_categories, :image2_id, :integer
    add_column :refinery_cafeteria_categories, :image3_id, :integer
  end
end
