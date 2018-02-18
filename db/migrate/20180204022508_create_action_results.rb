class CreateActionResults < ActiveRecord::Migration[5.1]
  def change
    create_table :action_results do |t|
      t.references :workshop
      t.references :lookup_process_stage
      t.integer :ar_number
      t.string  :action
      t.string  :result
      t.boolean :active,  default: true

      t.timestamps
    end
    add_index :action_results, :ar_number
    add_index :action_results, :active
  end
end
