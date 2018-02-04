class CreateToeTags < ActiveRecord::Migration[5.1]
  def change
    create_table :toe_tags do |t|
      t.integer :priority
      t.string :big_small_now
      t.string :solution
      t.string :success_measurement

      t.timestamps
    end
  end
end
