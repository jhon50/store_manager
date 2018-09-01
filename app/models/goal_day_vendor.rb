class GoalDayVendor < ApplicationRecord
  belongs_to :goal_day
  has_many :vendors
end
