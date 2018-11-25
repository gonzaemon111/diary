require "rails_helper"

RSpec.describe OmniauthProfile, type: :model do
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
    subject { create(:omniauth_profile) }
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_presence_of(:token) }
    it { is_expected.to validate_presence_of(:refresh_token) }

    it { is_expected.to allow_value(*valid_emails).for(:email) }
    it { is_expected.not_to allow_value(*invalid_emails).for(:email) }
  end

  context "association" do
    subject { create(:omniauth_profile) }
    it { is_expected.to belong_to(:user) }
  end

  context "db" do
    subject { create(:omniauth_profile) }

    it { is_expected.to have_db_column(:uid).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:image).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:token).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:refresh_token).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

    it { should have_db_index(:description) }
    it { should have_db_index(:email) }
    it { should have_db_index(:user_id) }
    it { should have_db_index(:image) }
    it { should have_db_index(:name) }
    it { should have_db_index(:provider) }
    it { should have_db_index(:refresh_token) }
    it { should have_db_index(:token) }
    it { should have_db_index(:uid) }
  end
end
