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
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }
    it { is_expected.to validate_presence_of(:sign_in_count) }
    it { is_expected.to validate_presence_of(:failed_attempts) }

    it { is_expected.to validate_numericality_of(:sign_in_count).only_integer }
    it { is_expected.to validate_numericality_of(:failed_attempts).only_integer }

    it { is_expected.to validate_uniqueness_of(:confirmation_token) }
    it { is_expected.to validate_uniqueness_of(:unlock_token) }
    it { is_expected.to validate_uniqueness_of(:reset_password_token) }

    it { is_expected.to validate_length_of(:name).is_at_least(1) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    it { is_expected.to validate_length_of(:password_confirmation).is_at_least(6) }

    it { is_expected.to allow_value(*valid_emails).for(:email) }
    it { is_expected.not_to allow_value(*invalid_emails).for(:email) }
  end

  context "association" do
    subject { create(:user) }
    it { is_expected.to have_many(:omniauth_profiles) }
  end
end
