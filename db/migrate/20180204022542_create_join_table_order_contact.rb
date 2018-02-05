class CreateJoinTableOrderContact < ActiveRecord::Migration[5.1]
  def change
    create_join_table :supplier_jobs, :people, table_name: :order_contacts do |t|
      t.index :supplier_job_id
      t.index :person_id
    end
  end
end
