class CreateJoinTableJobContact < ActiveRecord::Migration[5.1]
  def change
    create_join_table :job_contacts do |t|
      t.index [:customer_job_id, :person_id]
      t.index [:person_id, :customer_job_id]
    end
  end
end
