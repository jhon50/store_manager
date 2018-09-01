class CreateGoalDayVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :goal_day_vendors do |t|
      t.string :name
      t.references :goal_day, foreign_key: true

      t.timestamps
    end
  end
end
