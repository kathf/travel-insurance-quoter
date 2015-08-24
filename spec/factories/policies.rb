FactoryGirl.define do
  factory :policy do
    id 1
    age_min 18
    age_max 69
    trip_days_min 1
    trip_days_max 365
    price { rand(1..100) }
  end
end
