require "rails_helper"

RSpec.describe Reminder, type: :model do
  context "validation" do
    subject { create(:reminder) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:execute_time) }
  end

  context "association" do
    subject { create(:reminder) }
    it { is_expected.to belong_to(:user) }
  end

  context "db" do
    subject { create(:reminder) }
    it { is_expected.to have_db_column(:value).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:execute_time).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:is_finished).of_type(:boolean).with_options(default: false) }

    it { should have_db_index(:value) }
    it { should have_db_index(:execute_time) }
    it { should have_db_index(:user_id) }
  end
end
