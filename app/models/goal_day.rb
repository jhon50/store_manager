class GoalDay < ApplicationRecord
  belongs_to :goal
  has_many :vendors
end
