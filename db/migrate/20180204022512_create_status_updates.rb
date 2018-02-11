class CreateStatusUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :status_updates do |t|
      t.references :organization
      t.references  :date_lookup
      t.references  :person
      t.references  :action_result
      t.references  :job_order, polymorphic: true
      t.text        :attachment
      t.text        :text
      t.boolean     :active, :default => 1

      t.timestamps
    end
    add_index :status_updates, :active
  end
end
