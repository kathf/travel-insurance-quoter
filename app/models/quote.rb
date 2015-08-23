class Quote < ActiveRecord::Base
  belongs_to :policy

  validates :user_reference, uniqueness: true
  validates :age, numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 69, only_integer: true }, presence: true
  validates :trip_days, numericality: { only_integer: true }, presence: true

end
