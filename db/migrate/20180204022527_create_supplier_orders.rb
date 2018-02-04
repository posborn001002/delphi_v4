class CreateSupplierOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :supplier_orders do |t|
      t.string :order_name
      t.string :ref_number
      t.text :order_description


      t.timestamps
    end
  end
end
