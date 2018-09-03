class GoalDaysCreatorService
  class GoalDaysCreationError < StandardError; end
  def initialize(days, goal)
    @days = days
    @goal = goal
  end

  def call
    parse_and_create_days
  end

  private

  def parse_and_create_days
    @days = @days.to_h.with_indifferent_access.map do |key, day|
      persisted_day = create_day(day)
      create_day_vendor(day[:vendors], persisted_day)
    end
  end

  def create_day(day)
    Day.create!(date: day[:date], amount: day[:amount], goal: @goal)
  end

  def create_day_vendor(vendors, day)
    vendors.map {|vendor| DayVendor.create!(vendor_id: vendor, day: day) }
  end
end