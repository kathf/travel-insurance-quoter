class Quote < ActiveRecord::Base

  belongs_to :policy

  validates :age,
              numericality: {
                greater_than_or_equal_to: 18,
                less_than_or_equal_to: 69,
                only_integer: true },
              presence: true

  validates :trip_days,
              numericality: {
                only_integer: true },
              presence: true

end
