class Vendor < ApplicationRecord
  belongs_to :store
  has_many :goal_day_vendors
end
