class CreatePainPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :pain_points do |t|
      t.belongs_to :Workshop, foreign_key: true
      t.text :symptom
      t.text :impact

      t.timestamps
    end
  end
end
