FactoryGirl.define do
  factory :quote do    
    dob { Faker::Date.birthday(min_age = 18, max_age = 69) }
    trip_start { Faker::Date.forward(200) }
    trip_end { Faker::Date.between( 200.days.from_now, 1.year.from_now) }
    policy
  end
end
