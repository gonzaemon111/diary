class Nikki < ApplicationRecord
  validates :value, presence: true
  validates :datetime, presence: true

  belongs_to :user
end
