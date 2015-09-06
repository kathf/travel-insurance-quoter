policies = [
  {"id"=>1, "age_min"=>18, "age_max"=>49, "trip_days_min"=>1, "trip_days_max"=>7, "price"=> 50},
  {"id"=>2, "age_min"=>18, "age_max"=>49, "trip_days_min"=>8, "trip_days_max"=>14, "price"=> 60},
  {"id"=>3, "age_min"=>18, "age_max"=>49, "trip_days_min"=>15, "trip_days_max"=>21, "price"=> 70},
  {"id"=>4, "age_min"=>18, "age_max"=>49, "trip_days_min"=>22, "trip_days_max"=>365, "price"=> 82},
  {"id"=>5, "age_min"=>50, "age_max"=>59, "trip_days_min"=>1, "trip_days_max"=>7, "price"=> 60},
  {"id"=>6, "age_min"=>50, "age_max"=>59, "trip_days_min"=>8, "trip_days_max"=>14, "price"=> 73},
  {"id"=>7, "age_min"=>50, "age_max"=>59, "trip_days_min"=>15, "trip_days_max"=>21, "price"=> 80},
  {"id"=>8, "age_min"=>50, "age_max"=>59, "trip_days_min"=>22, "trip_days_max"=>365, "price"=> 90},
  {"id"=>9, "age_min"=>60, "age_max"=>69, "trip_days_min"=>1, "trip_days_max"=>7, "price"=> 70},
  {"id"=>10, "age_min"=>60, "age_max"=>69, "trip_days_min"=>8, "trip_days_max"=>14, "price"=> 80},
  {"id"=>11, "age_min"=>60, "age_max"=>69, "trip_days_min"=>15, "trip_days_max"=>21, "price"=> 90},
  {"id"=>12, "age_min"=>60, "age_max"=>69, "trip_days_min"=>22, "trip_days_max"=>365, "price"=>100 }
]

policies.each do |hash|
  Policy.create!(hash)
end
