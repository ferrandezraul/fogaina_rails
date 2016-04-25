# This migration comes from refinery_cafeteria_categories (originally 1)
class CreateCafeteriaCategoriesCafeteriaCategories < ActiveRecord::Migration

  def up
    create_table :refinery_cafeteria_categories do |t|
      t.string :title
      t.text :description
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

    Refinery::CafeteriaCategories::CafeteriaCategory.create_translation_table! :title => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-cafeteria_categories"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/cafeteria_categories/cafeteria_categories"})
    end

    drop_table :refinery_cafeteria_categories

    Refinery::CafeteriaCategories::CafeteriaCategory.drop_translation_table!

  end

end
