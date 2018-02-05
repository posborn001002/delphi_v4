class CreateCustomerJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_jobs do |t|
      t.string      :job_name
      t.text        :job_description
      t.string      :ref_number
      t.references  :organization
    end
  end
end
