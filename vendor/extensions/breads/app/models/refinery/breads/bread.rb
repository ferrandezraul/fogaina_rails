module Refinery
  module Breads
    class Bread < Refinery::Core::BaseModel
      self.table_name = 'refinery_breads'

      translates :name, :description

      validates :name, :presence => true, :uniqueness => true
      validates :description, :presence => true
      validates :available_days, :presence => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
