class OmniauthProfile < ApplicationRecord
  belongs_to :user
  validates :uid, presence: true
  validates :name, presence: true
  validates :provider, presence: true
  validates :token, presence: true
  validates :refresh_token, presence: true

  enum provider: { line: 0, twitter: 1 }
end
