class Store < ApplicationRecord
  belongs_to :user
  has_many :goals, dependent: :destroy
  has_many :vendors

  validates :name, :address, presence: true
end
