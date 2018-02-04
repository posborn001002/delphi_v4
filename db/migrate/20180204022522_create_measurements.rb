class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
      t.references :DateLookup, foreign_key: true
      t.references :Metric, foreign_key: true
      t.references :Person, foreign_key: true
      t.decimal :value

      t.timestamps
    end
  end
end
