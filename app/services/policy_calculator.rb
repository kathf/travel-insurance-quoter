class PolicyCalculator

  def initialize(quote)
    @age = quote.age
    @trip_days = quote.trip_days
  end

  def calculate_policy
    res = Policy.within_age_range(@age).within_days_range(@trip_days)
    return res[0]
  end

end
