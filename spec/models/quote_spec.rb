require 'rails_helper'

RSpec.describe Quote, type: :model do

  it { is_expected.to belong_to(:policy) }

  it { is_expected.to validate_presence_of(:dob) }
  it { is_expected.to validate_presence_of(:trip_start) }
  it { is_expected.to validate_presence_of(:trip_end) }

  it { is_expected.to callback(:validate_dob_within_range).before(:validate) }
  it { is_expected.to callback(:validate_future_trip_date).before(:validate) }
  it { is_expected.to callback(:validate_end_date_after_start_date).before(:validate) }
  it { is_expected.to callback(:validate_trip_length).before(:validate) }

end
