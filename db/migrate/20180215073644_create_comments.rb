class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :status_update
      t.references :comment
      t.references :person
      t.text :comment

      t.timestamps
    end
  end
end
