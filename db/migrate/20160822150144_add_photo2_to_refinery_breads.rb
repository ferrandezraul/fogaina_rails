class AddPhoto2ToRefineryBreads < ActiveRecord::Migration
  def change
    add_column :refinery_breads, :photo2, :integer
  end
end
