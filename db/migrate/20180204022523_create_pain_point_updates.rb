class CreatePainPointUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :pain_point_updates do |t|
      t.references  :pain_point
      t.references  :progress, polymorhpic: true
      t.integer     :pass_fail_status

      t.timestamps
    end
  end
end
