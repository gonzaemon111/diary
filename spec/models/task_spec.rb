require "rails_helper"

RSpec.describe Task, type: :model do
  context "validation" do
    subject { create(:task) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:date_time) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  context "association" do
    subject { create(:task) }
    it { is_expected.to belong_to(:user) }
  end

  context "db" do
    subject { create(:task) }
    it { is_expected.to have_db_column(:value).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:date_time).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).with_options(null: false) }
    it { is_expected.to have_db_column(:is_done).of_type(:boolean).with_options(null: false) }

    it { should have_db_index(:value) }
    it { should have_db_index(:date_time) }
    it { should have_db_index(:user_id) }
  end
end
