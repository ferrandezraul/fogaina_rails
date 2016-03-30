# This migration comes from refinery_image_slideshows (originally 7)
class CreateImageSlidesTranslations < ActiveRecord::Migration
  def up
    Refinery::ImageSlideshows::ImageSlide.create_translation_table!({
      :title => :string,
      :caption => :string,
      :link_url => :string
    }, {
      :migrate_data => true
    })
  end

  def down
    Refinery::ImageSlideshows::ImageSlide.drop_translation_table! :migrate_data => true
  end
end
