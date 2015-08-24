require 'rails_helper'

RSpec.describe Quote, type: :model do

  it { is_expected.to belong_to(:policy) }

  it { is_expected.to validate_presence_of(:dob) }
  it { is_expected.to validate_presence_of(:trip_days) }

  it do
    should validate_numericality_of(:dob).
      is_greater_than_or_equal_to(Time.now.years_ago(69)).
      is_less_than_or_equal_to(Time.now.years_ago(18))
  end

end
