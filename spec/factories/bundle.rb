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

    factory :bundle_one_lily do
      bundle_quantity '3'
      bundle_cost '9.95'
    end

    factory :bundle_two_lily do
      bundle_quantity '6'
      bundle_cost '16.95'
    end

    factory :bundle_three_lily do
      bundle_quantity '9'
      bundle_cost '24.95'
    end

    factory :bundle_one_tulip do
      bundle_quantity '3'
      bundle_cost '5.95'
    end

    factory :bundle_two_tulip do
      bundle_quantity '5'
      bundle_cost '9.95'
    end

    factory :bundle_three_tulip do
      bundle_quantity '9'
      bundle_cost '16.99'
    end

    association :product, factory: :product, strategy: :create

  end
end