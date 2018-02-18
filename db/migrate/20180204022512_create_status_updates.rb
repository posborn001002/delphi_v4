class CreateStatusUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :status_updates do |t|
      #date is used in case you want to over-ride the default of 'now' (time is always taken from the created-at field)
      t.references  :date_lookup
      t.references  :person
      # sparsely populated foreign keys: "this status update is about a...."
      t.references  :process_owner
      t.references  :customer
      t.references  :supplier
      t.references  :customer_job
      t.references  :supplier_order
      t.references  :toe_tag
      t.references  :action_result
      t.references  :pain_point
      t.references  :workshop
      t.references  :metric
      # the type field is part of the STI set-up
      t.text        :type
      t.text        :attachment
      t.text        :text

      t.boolean     :active, default: true

      t.timestamps
    end
    add_index :status_updates, :active
  end
end
