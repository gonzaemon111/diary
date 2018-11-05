require "rails_helper"

RSpec.describe Nikki, type: :model do
  context "validation" do
    subject { create(:nikki) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:datetime) }
  end
end
