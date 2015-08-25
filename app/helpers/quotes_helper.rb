module QuotesHelper

  def trip_days(quote)
    res = (quote.trip_end - quote.trip_start) / (60*60*24)
    return res.ceil
  end

  def age_years(quote)
    res = (Time.now - quote.dob) / (60*60*24*365)
    return res.floor
  end

end
