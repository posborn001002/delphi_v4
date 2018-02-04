class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, unique: true
      t.string :telephone
      t.references :organization, foreign_key: true
      t.string :job_title

      t.timestamps
    end
  end
end
