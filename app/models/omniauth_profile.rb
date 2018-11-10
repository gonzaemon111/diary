class OmniauthProfile < ApplicationRecord
  belongs_to :user
  validates :uid, presence: true
  validates :name, presence: true
  validates :provider, presence: true
  validates :token, presence: true
  validates :secret, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
