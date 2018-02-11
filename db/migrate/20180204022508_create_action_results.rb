class CreateActionResults < ActiveRecord::Migration[5.1]
  def change
    create_table :action_results do |t|
      t.references :organization
      t.references :workshop
      t.integer :ar_number
      t.string  :action
      t.string  :result
      t.boolean :active, :default => 1
      t.integer :version, :default => 1

      t.timestamps
    end
    add_index :action_results, :ar_number
    add_index :action_results, :active
    add_index :action_results, :version
  end
end
