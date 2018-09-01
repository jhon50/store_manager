class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :ref_month
      t.decimal :amount, precision: 16, scale: 2
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
