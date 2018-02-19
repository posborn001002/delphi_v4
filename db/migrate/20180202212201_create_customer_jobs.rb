class CreateCustomerJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_jobs do |t|
      t.references  :process_owner
      t.references  :customer
      t.references  :order_date
      t.references  :due_date
      t.string      :job_name
      t.text        :job_description
      t.string      :ref_number
      t.boolean     :active,  default: true

      t.timestamps
    end
    add_index :customer_jobs, :active
  end
end
