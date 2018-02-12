class CreateJoinTableContact < ActiveRecord::Migration[5.1]
  def change
    create_join_table :customer_jobs, :people, table_name: :job_contacts do |t|
      t.index :customer_job_id
      t.index :person_id
    end
  end
end

class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.references  :organization
      t.references  :person
      # can be for a customer job 'CustomerJob', or a SupplierOrder
      t.references  :contact_for, polymorpic: true
      t.boolean     :active, :default => 1

      t.timestamps
    end
    add_index :contacts, :active
  end
end
