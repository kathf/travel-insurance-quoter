class Quote < ActiveRecord::Base

  belongs_to :policy

  validates :dob, presence: true
  validates :trip_start, presence: true
  validates :trip_end, presence: true

end
