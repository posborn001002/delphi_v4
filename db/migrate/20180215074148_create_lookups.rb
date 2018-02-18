class CreateLookups < ActiveRecord::Migration[5.1]
  def change
    create_table :lookups do |t|
      t.string :type
      t.integer :sequence
      t.string :short_text
      t.string :long_text
      t.text :description
    end
  end
end
