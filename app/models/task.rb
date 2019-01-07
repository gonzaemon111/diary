class Task < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :value, presence: true
  validates :date_time, presence: true
end
