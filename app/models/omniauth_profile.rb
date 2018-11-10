class OmniauthProfile < ApplicationRecord
  belongs_to :user

  validates :email, format: { with: Constants::VALID_EMAIL_REGEX, if: :email_present? }
  validates :uid, presence: true
  validates :name, presence: true
  validates :provider, presence: true
  validates :token, presence: true
  validates :refresh_token, presence: true

  enum provider: { line: 0, twitter: 1 }

  def email_present?
    email.present?
  end
end
