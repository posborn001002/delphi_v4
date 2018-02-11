class CreatePainPointUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :pain_point_updates do |t|
      t.references  :organization
      t.references  :pain_point
      t.references  :progress, polymorhpic: true
      t.integer     :pass_fail_status
      t.boolean     :active, :default => 1

      t.timestamps
    end
    add_index :pain_point_updates, :active
  end
end
