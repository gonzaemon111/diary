class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :lockable,
         :timeoutable,
         :omniauthable,
         omniauth_providers: %i[line],
         authentication_keys: %i[name]

  validates :email, format: { with: Constants::VALID_EMAIL_REGEX, if: :email_present? }
  validates :name, presence: true, length: { minimum: 1 }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :sign_in_count, presence: true, numericality: { only_integer: true }
  validates :failed_attempts, presence: true, numericality: { only_integer: true }
  validates :confirmation_token, uniqueness: true
  validates :unlock_token, uniqueness: true
  validates :reset_password_token, uniqueness: true

  has_many :omniauth_profiles, dependent: :destroy

  # 登録時にemailを不要とする オーバーライド
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def email_present?
    email.present?
  end
end
