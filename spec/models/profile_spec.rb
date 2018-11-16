require 'rails_helper'

RSpec.describe Profile, type: :model do
  context "validation" do
    subject { create(:profile) }
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:provider) }
  end
end
