class Day < ApplicationRecord
  belongs_to :goal
  has_many :day_vendors, inverse_of: :day
  accepts_nested_attributes_for :day_vendors, reject_if: :all_blank, allow_destroy: true
end