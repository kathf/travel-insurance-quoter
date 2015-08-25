class Quote < ActiveRecord::Base

  belongs_to :policy
  delegate :price, to: :policy

  validates :dob, presence: true
  validates :trip_start, presence: true
  validates :trip_end, presence: true

  validate :validate_dob_within_range,
           :validate_future_trip_date,
           :validate_end_date_after_start_date,
           :validate_trip_length

  def validate_dob_within_range
    if !dob || !(18..69).include?(age)
      errors.add(:dob, "We only provide insurance policies for people aged 18 to 69.")
    end
  end

  def validate_future_trip_date
    if !trip_start || trip_start < Time.now
      errors.add(:trip_start, "Please select a trip start date in the future.")
    end
  end

  def validate_end_date_after_start_date
    if !trip_start || trip_start > trip_end
      errors.add(:trip_end, "Please select a trip end date BEFORE the start date.")
    end
  end

  def validate_trip_length
    if !trip_start || !trip_end || trip_days > 365
      errors.add(:trip_end, "We only provide insurance policies for trips less than 365 days.")
    end
  end

  def age
    # Difference in years, less one if you have not had a birthday this year.
    a = Time.now.year - dob.year
    a = a - 1 if (
         dob.month >  Time.now.month or
        (dob.month >= Time.now.month and dob.day > Time.now.day)
        )
    return a
  end

  def trip_days
    res = (trip_end - trip_start).to_i / (60*60*24)
    return res.to_i
  end

end
