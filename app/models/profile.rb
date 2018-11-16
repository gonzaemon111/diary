class Profile < ApplicationRecord
  enum provider: { line: 0, twitter: 1 }
  validates :provider, presence: true
  validates :uid, presence: true
end
