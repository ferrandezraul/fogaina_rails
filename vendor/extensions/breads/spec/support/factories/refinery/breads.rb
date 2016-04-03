
FactoryGirl.define do
  factory :bread, :class => Refinery::Breads::Bread do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

