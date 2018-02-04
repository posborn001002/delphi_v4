class CreateJoinTableOrderContact < ActiveRecord::Migration[5.1]
  def change
    create_join_table :order_contacts do |t|
      t.index [:supplier_job_id, :person_id]
      t.index [:person_id, :supplier_job_id]
    end
  end
end
