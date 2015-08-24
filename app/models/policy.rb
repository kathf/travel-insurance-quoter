class Policy < ActiveRecord::Base

  has_many :quotes

  validates :effective_date, presence: true
  validates :price, numericality: { greater_than: 0 }, presence: true
  validates :age_min, numericality: { only_integer: true }, presence: true
  validates :trip_days_min, numericality: { only_integer: true }, presence: true
  validates :age_max, numericality: { greater_than_or_equal_to: :age_min }, presence: true
  validates :trip_days_max, numericality: { greater_than_or_equal_to: :trip_days_min }, presence: true

  def self.within_age_range(age)
    where('age_min <= ? and age_max >= ?', age, age)
  end

  def self.within_days_range(days)
    where('trip_days_min <= ? and trip_days_max >= ?', days, days)
  end

end
