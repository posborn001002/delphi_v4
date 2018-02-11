class CreateToeTags < ActiveRecord::Migration[5.1]
  def change
    create_table :toe_tags do |t|
      t.references  :organization
      t.references  :workshop
      t.integer     :priority
      t.string      :big_small_now
      t.string      :ADTE
      t.string      :solution
      t.string      :success_measurement
      t.boolean     :active, :default => 1

      t.timestamps
    end
    add_index :toe_tags, :active
  end
end
