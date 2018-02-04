class CreatePainPointUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :pain_point_updates do |t|
      t.references :PainPoint, foreign_key: true
      t.references :progress_id, foreign_key: true
      t.string :progress_type
      t.integer :pass_fail_status

      t.timestamps
    end
  end
end
