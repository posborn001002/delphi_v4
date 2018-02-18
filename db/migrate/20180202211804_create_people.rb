class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.references :organization
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :telephone
      t.string :job_title
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :people, :active
  end
end
