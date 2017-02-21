FactoryGirl.define do
  factory :line_item do
    quantity "5"

    association :order, factory: :order, strategy: :create
    association :product, factory: :product, strategy: :create

  end
end