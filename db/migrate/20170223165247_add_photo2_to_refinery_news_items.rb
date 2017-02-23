class AddPhoto2ToRefineryNewsItems < ActiveRecord::Migration
  def change
    add_column :refinery_news_items, :photo2_id, :integer
  end
end
