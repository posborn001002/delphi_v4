class CreateUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :updates do |t|
      t.references :DateLookup, foreign_key: true
      t.references :Person, foreign_key: true
      t.references :ActionResult, foreign_key: true
      t.id :job_order_id
      t.string :job_order_type
      t.text :attachment
      t.text :text

      t.timestamps
    end
  end
end
