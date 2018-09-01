class CreateGoalDays < ActiveRecord::Migration[5.2]
  def change
    create_table :goal_days do |t|
      t.decimal :amount, precision: 16, scale: 2
      t.references :goal, foreign_key: true

      t.timestamps
    end
  end
end
