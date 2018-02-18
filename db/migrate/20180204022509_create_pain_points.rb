class CreatePainPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :pain_points do |t|
      t.references  :action_result
      t.references  :toe_tag
      t.text        :symptom
      t.text        :impact
      t.boolean     :active, default: true

      t.timestamps
    end
    add_index :pain_points, :active
  end
end
