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
end
