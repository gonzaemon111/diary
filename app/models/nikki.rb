class Nikki < ApplicationRecord
  validates :value, presence: true
  validates :datetime, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
