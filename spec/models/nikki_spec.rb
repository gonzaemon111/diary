require "rails_helper"

RSpec.describe Nikki, type: :model do
  context "validation" do
    subject { create(:nikki) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:datetime) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  context "association" do
    subject { create(:nikki) }
    it { is_expected.to belong_to(:user) }
  end

  context "db" do
    subject { create(:nikki) }
    it { is_expected.to have_db_column(:value).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:datetime).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id) }

    it { should have_db_index(:value) }
    it { should have_db_index(:datetime) }
    it { should have_db_index(:user_id) }
  end
end
