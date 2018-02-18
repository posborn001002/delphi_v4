class CreateMetrics < ActiveRecord::Migration[5.1]
  def change
    create_table :metrics do |t|
      t.references  :process_owner
      t.references  :action_result
      t.string      :name
      t.string      :datatype
      t.boolean     :active, default: true

      t.timestamps
    end
    add_index :metrics, :active
  end
end
