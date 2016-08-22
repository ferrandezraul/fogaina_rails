module Refinery
  module CafeteriaCategories
    class CafeteriaCategory < Refinery::Core::BaseModel
      self.table_name = 'refinery_cafeteria_categories'


      translates :title, :description

      validates :title, :presence => true, :uniqueness => true
      validates :image, :presence => true

      validates :description, length: { minimum: 30 }

      belongs_to :image, :class_name => '::Refinery::Image'
      belongs_to :image2, :class_name => '::Refinery::Image'
      belongs_to :image3, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
