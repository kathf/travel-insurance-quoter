require 'rails_helper'

RSpec.describe QuotesHelper, type: :helper do

  describe '#trip_days' do
    let(:dob)       { Time.now - 40.years }
    let(:t_start)   { Time.now + 18.days }
    let(:t_end)     { Time.now + 38.days }
    let(:quote)     { Quote.create(dob: dob, trip_end: t_end, trip_start: t_start) }

    specify 'that trip length is returned in days as integer' do
      expect( trip_days(quote) ).to eq(20)
    end
  end

  describe '#age_years' do
    let(:dob)       { Time.now - 40.years }
    let(:t_start)   { Time.now + 18.days }
    let(:t_end)     { Time.now + 38.days }
    let(:quote)     { Quote.create(dob: dob, trip_end: t_end, trip_start: t_start) }

    specify 'that age returned in years as integer' do
      expect( age_years(quote) ).to eq(40)
    end
  end
end
