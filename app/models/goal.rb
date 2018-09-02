class Goal < ApplicationRecord
  class DayAlreadyExistError < StandardError; end
  belongs_to :store
  has_many :days

  before_save :unique_days?
  validates :amount, :start_date, :end_date, :ref_month, presence: true

  def retrieve_days
    (start_date.to_datetime...end_date.to_datetime + 1.day)
        .map{|a| Day.new(date: a, goal: self) }
  end

  private

  def unique_days?
    days = self.retrieve_days.pluck(:date)
    persisted_days = Goal.joins(:days).where(store: self.store).pluck(:'days.date')
    days_left = days - persisted_days
    raise DayAlreadyExistError, 'Já existe uma meta com um dos dias no intervalo escolhidos' if days.length != days_left.length
  end

end
