module QuotesHelper

  def trip_days(quote)
    res = (quote.trip_end - quote.trip_start) / (60*60*24)
    return res.to_i
  end

  def age_years(quote)
    res = (Time.now - quote.dob) / (60*60*24*365)
    return res.to_i
  end

end
