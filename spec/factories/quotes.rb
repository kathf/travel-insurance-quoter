FactoryGirl.define do
  factory :quote do
    age { rand(18..69) }
    trip_days { rand(1..365) }
  end
end
