class CreateJoinTableOrderProgress < ActiveRecord::Migration[5.1]
  def change
    create_join_table :supplier_orders, :action_results do |t|
      # t.index [:supplier_order_id, :action_result_id]
      # t.index [:action_result_id, :supplier_order_id]
    end
  end
end
