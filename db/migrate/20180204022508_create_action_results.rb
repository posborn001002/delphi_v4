class CreateActionResults < ActiveRecord::Migration[5.1]
  def change
    create_table :action_results do |t|
      t.references :Organization, foreign_key: true
      t.integer :ar_number
      t.string :action
      t.string :result

      t.timestamps
    end
    add_index :action_results, :ar_number
  end
end
