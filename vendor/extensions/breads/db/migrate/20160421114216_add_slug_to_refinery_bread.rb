class AddSlugToRefineryBread < ActiveRecord::Migration
  def change
    add_column :refinery_breads, :slug, :string
    add_index :refinery_breads, :slug
  end
end
