class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table    :measurements do |t|
      t.references  :organization
      t.references  :date_lookup
      t.references  :metric
      t.references  :person
      t.decimal     :value
      t.boolean     :active, :default => 1

      t.timestamps
    end
    add_index :measurements, :active
  end
end
