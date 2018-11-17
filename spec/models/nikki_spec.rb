require "rails_helper"

RSpec.describe Nikki, type: :model do
  context "validation" do
    subject { create(:nikki) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:datetime) }
  end
  context "association" do
    subject { create(:nikki) }
    it { is_expected.to belong_to(:user) }
  end
end
