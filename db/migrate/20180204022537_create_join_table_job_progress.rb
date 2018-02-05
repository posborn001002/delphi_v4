class CreateJoinTableJobProgress < ActiveRecord::Migration[5.1]
  def change
    create_join_table :customer_jobs, :action_results do |t|
      t.index :customer_job_id
      t.index :action_result_id
      # t.index [:action_result_id, :customer_job_id]
    end
  end
end
