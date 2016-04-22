class AddPhotoToRefineryNewsItem < ActiveRecord::Migration
  def change
    add_column :refinery_news_items, :photo_id, :integer
  end
end
