require 'rails_helper'

RSpec.describe Quote, type: :model do

  it { is_expected.to belong_to(:policy) }

  it { is_expected.to validate_presence_of(:age) }
  it { is_expected.to validate_presence_of(:trip_days) }

  it { should validate_numericality_of(:trip_days).only_integer }
  it { should validate_numericality_of(:age).only_integer }

  it { should validate_uniqueness_of(:user_reference) }

  it do
    should validate_numericality_of(:age).
      is_greater_than_or_equal_to(18).
      is_less_than_or_equal_to(69)
  end

end
