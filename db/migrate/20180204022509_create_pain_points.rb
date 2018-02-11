class CreatePainPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :pain_points do |t|
      t.references  :organization
      t.references  :workshop
      t.references  :action_result
      t.references  :toe_tag
      t.text        :symptom
      t.text        :impact
      t.boolean     :active

      t.timestamps
    end
    add_index :pain_points, :active
  end
end
