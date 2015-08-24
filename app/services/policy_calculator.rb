class PolicyCalculator

  def initialize(quote)
    @dob = quote.dob
    @trip_start = quote.trip_start
    @trip_end = quote.trip_end
  end

  def age
    # Difference in years, less one if you have not had a birthday this year.
    a = Time.now.year - @dob.year
    a = a - 1 if (
         @dob.month >  Time.now.month or
        (@dob.month >= Time.now.month and @dob.day > Time.now.day)
        )
    return a
  end

  def trip_days
    res = (@trip_end - @trip_start).to_i / (60*60*24)
    return res.to_i
  end

  def calculate_policy
    res = Policy.within_age_range(age).within_days_range(trip_days)
    return res[0]
  end

end
