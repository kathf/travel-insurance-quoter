require 'rails_helper'

RSpec.describe Policy, type: :model do

  it { is_expected.to have_many(:quotes) }

  it { is_expected.to validate_presence_of(:age_min) }
  it { is_expected.to validate_presence_of(:age_max) }
  it { is_expected.to validate_presence_of(:trip_days_min) }
  it { is_expected.to validate_presence_of(:trip_days_max) }
  it { is_expected.to validate_presence_of(:price) }

  it { should validate_numericality_of(:age_max) }
  it { should validate_numericality_of(:age_min) }
  it { should validate_numericality_of(:trip_days_max) }
  it { should validate_numericality_of(:trip_days_min) }

  it do
    should validate_numericality_of(:price).
      is_greater_than(0)
  end

end
