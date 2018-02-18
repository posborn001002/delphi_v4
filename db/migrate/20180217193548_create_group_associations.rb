class CreateGroupAssociations < ActiveRecord::Migration[5.1]
  def change
    create_table :group_associations do |t|
      t.string :type
      t.references :person
      t.references :workshop
      t.references :customer_job
      t.references :supplier_order
      t.references :toe_tag
      t.references :lookup
    end
  end
end
