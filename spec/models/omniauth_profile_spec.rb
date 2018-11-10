require "rails_helper"

RSpec.describe OmniauthProfile, type: :model do
  context "validation" do
    subject { create(:omniauth_profile) }
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_presence_of(:token) }
    it { is_expected.to validate_presence_of(:refresh_token) }
  end

  context "association" do
    subject { create(:omniauth_profile) }
    it { is_expected.to belong_to(:user) }
  end
end
