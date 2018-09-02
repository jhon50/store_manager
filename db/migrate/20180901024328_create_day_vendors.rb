class CreateDayVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :day_vendors do |t|
      t.references :vendor, foreign_key: true
      t.references :day, foreign_key: true

      t.timestamps
    end
  end
end
