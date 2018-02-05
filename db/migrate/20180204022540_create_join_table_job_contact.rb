class CreateJoinTableJobContact < ActiveRecord::Migration[5.1]
  def change
    create_join_table :customer_jobs, :people, table_name: :job_contacts do |t|
      t.index :customer_job_id
      t.index :person_id
    end
  end
end
