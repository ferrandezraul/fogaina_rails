class AddPhoto3ToRefineryBreads < ActiveRecord::Migration
  def change
    add_column :refinery_breads, :photo3_id, :integer
  end
end
