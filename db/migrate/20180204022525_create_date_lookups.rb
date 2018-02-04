class CreateDateLookups < ActiveRecord::Migration[5.1]
  def change
    create_table :date_lookups do |t|
      t.date :date
      t.integer :day_of_month
      t.integer :month
      t.integer :quarter
      t.integer :year
      t.integer :week_of_year
      t.integer :week_of_quarter

      t.timestamps
    end
    add_index :date_lookups, :date
  end
end
