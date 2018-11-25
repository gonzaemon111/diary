require "rails_helper"

RSpec.describe Profile, type: :model do
  context "validation" do
    subject { create(:profile) }
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:provider) }
  end

  context "db" do
    subject { create(:profile) }
    it { is_expected.to have_db_column(:uid).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:provider) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
end
