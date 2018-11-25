class Reminder < ApplicationRecord
  belongs_to :user
  validates :value, presence: true
  validates :execute_time, presence: true
  validates :user_id, presence: true
end
