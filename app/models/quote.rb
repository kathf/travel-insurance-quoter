class Quote < ActiveRecord::Base
  has_many :users

  validates :effective_date, presence: true
  validates :price, numericality: { greater_than: 0 }, presence: true
  validates :age_min, numericality: { only_integer: true }, presence: true
  validates :trip_days_min, numericality: { only_integer: true }, presence: true
  validates :age_max, numericality: { greater_than_or_equal_to: :age_min }, presence: true
  validates :trip_days_max, numericality: { greater_than_or_equal_to: :trip_days_min }, presence: true
end
