require 'rails_helper'

RSpec.describe User, type: :model do
    it { is_expected.to belong_to(:quote) }
end
