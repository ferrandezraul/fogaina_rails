# This migration comes from refinery_breads (originally 1)
class CreateBreadsBreads < ActiveRecord::Migration

  def up
    create_table :refinery_breads do |t|
      t.string :name
      t.text :description
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

    Refinery::Breads::Bread.create_translation_table! :name => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-breads"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/breads/breads"})
    end

    drop_table :refinery_breads

    Refinery::Breads::Bread.drop_translation_table!

  end

end
