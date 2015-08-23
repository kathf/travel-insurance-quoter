quotes = [
  [18, 49, 1, 7, 50],
  [18, 49, 8, 14, 60],
  [18, 49, 15, 21, 70],
  [18, 49, 22, 356, 82],
  [50, 59, 1, 7, 60],
  [50, 59, 8, 14, 73],
  [50, 59, 15, 21, 80],
  [50, 59, 22, 356, 90],
  [60, 69, 1, 7, 70],
  [60, 69, 8, 14, 80],
  [60, 69, 15, 21, 90],
  [60, 69, 22, 356, 100]
]

today = Time.new(2015,8,23)

quotes.each do |array|
  Quote.create!(
    age_min: array[0],
    age_max: array[1],
    trip_days_min: array[2],
    trip_days_max: array[3],
    price: array[4],
    effective_date: today
  )
end