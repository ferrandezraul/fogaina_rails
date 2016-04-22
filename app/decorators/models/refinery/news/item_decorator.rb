# Open the Refinery::News::Item model for manipulation
Refinery::News::Item.class_eval do
  # Add an association to the Refinery::Image class, so we
  # can take advantage of the magic that the class provides
  belongs_to :photo, :class_name => '::Refinery::Image'
end