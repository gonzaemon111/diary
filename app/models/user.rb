class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :lockable,
         :timeoutable,
         :omniauthable, omniauth_providers: %i[line]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :name, presence: true, length: { minimum: 1 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validates :sign_in_count, presence: true, numericality: { only_integer: true }
  validates :failed_attempts, presence: true, numericality: { only_integer: true }
  validates :confirmation_token, uniqueness: true
  validates :unlock_token, uniqueness: true
  validates :reset_password_token, uniqueness: true
end
