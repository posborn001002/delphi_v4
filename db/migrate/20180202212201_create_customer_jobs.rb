class CreateCustomerJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_jobs do |t|
      t.references  :organization
      t.references  :customer, foreign_key: 'partner_id'
      t.string      :job_name
      t.text        :job_description
      t.string      :ref_number
      t.boolean     :active, :index, :default => 1

      t.timestamps
    end
    add_index :customer_jobs, :active
  end
end
