module Refinery
  module Breads
    class Bread < Refinery::Core::BaseModel
      attr_accessor :available_days
      attr_accessor :price

      self.table_name = 'refinery_breads'

      translates :name, :description

      validates :name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
