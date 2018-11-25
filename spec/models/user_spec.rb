require "rails_helper"

RSpec.describe User, type: :model do
  valid_emails = %w[
    user@foo.COM
    A_US-ER@f.b.org
    frst.lst@foo.jp
    a+b@baz.cn
  ]
  invalid_emails = %w[
    user@foo,com
    user_at_foo.org
    example.user@foo.
    foo@bar_baz.com
    foo@bar+baz.com
  ]
  context "validation" do
    subject { create(:user) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:sign_in_count) }
    it { is_expected.to validate_presence_of(:failed_attempts) }

    it { is_expected.to validate_numericality_of(:sign_in_count).only_integer }
    it { is_expected.to validate_numericality_of(:failed_attempts).only_integer }

    # it { is_expected.to validate_uniqueness_of(:confirmation_token) }
    # it { is_expected.to validate_uniqueness_of(:unlock_token) }
    # it { is_expected.to validate_uniqueness_of(:reset_password_token) }

    it { is_expected.to validate_length_of(:name).is_at_least(1) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }

    it { is_expected.to allow_value(*valid_emails).for(:email) }
    it { is_expected.not_to allow_value(*invalid_emails).for(:email) }
  end

  context "association" do
    subject { create(:user) }
    it { is_expected.to have_many(:omniauth_profiles).dependent(:destroy) }
    it { is_expected.to have_many(:nikkis).dependent(:destroy) }
    it { is_expected.to have_many(:reminders).dependent(:destroy) }
  end

  context "db" do
    subject { create(:user) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(default: "",null: false) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(default: "",null: false) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:sign_in_count).of_type(:integer) }
    it { is_expected.to have_db_column(:current_sign_in_ip).of_type(:string) }
    it { is_expected.to have_db_column(:last_sign_in_ip).of_type(:string) }
    it { is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:confirmed_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:confirmation_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:unconfirmed_email).of_type(:string) }
    it { is_expected.to have_db_column(:unlock_token).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }


    it { should have_db_index(:confirmation_token) }
    it { should have_db_index(:reset_password_token) }
    it { should have_db_index(:unlock_token) }
    it { should have_db_index(:name) }
  end
end
