FactoryGirl.define do
  factory :bundle do
    bundle_quantity "5"
    bundle_cost "6.99"

    factory :bundle_one_rose do
      bundle_quantity '5'
      bundle_cost '6.99'
    end

    factory :bundle_two_rose do
      bundle_quantity '10'
      bundle_cost '12.99'
    end

    association :product, factory: :product, strategy: :create

  end
end