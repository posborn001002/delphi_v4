class CreateSupplierOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :supplier_orders do |t|
      t.references  :process_owner
      t.references  :supplier
      t.string      :order_name
      t.string      :ref_number
      t.text        :order_description
      t.boolean     :active, default: true

      t.timestamps
    end
    add_index :supplier_orders, :active
  end
end
