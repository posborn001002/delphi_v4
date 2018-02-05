class CreateUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :updates do |t|
      t.references  :date_lookup
      t.references  :person
      t.references  :action_result
      t.integer     :job_order_id, foreign_key: true
      t.string      :job_order_type
      t.text        :attachment
      t.text        :text

      t.timestamps
    end
  end
end
