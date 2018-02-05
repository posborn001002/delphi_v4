class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table    :measurements do |t|
      t.references  :date_lookup
      t.references  :metric
      t.references  :person
      t.decimal     :value

      t.timestamps
    end
  end
end
