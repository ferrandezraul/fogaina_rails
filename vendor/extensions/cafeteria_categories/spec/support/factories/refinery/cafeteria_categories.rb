
FactoryGirl.define do
  factory :cafeteria_category, :class => Refinery::CafeteriaCategories::CafeteriaCategory do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

