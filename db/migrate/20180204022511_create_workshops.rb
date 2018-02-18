class CreateWorkshops < ActiveRecord::Migration[5.1]
  def change
    create_table :workshops do |t|
      t.references  :date_lookup
      t.references  :process_owner
      t.text        :capability_goal
      t.text        :process_name
      t.text        :process_description
      t.text        :left_boundary
      t.text        :right_boundary
      t.boolean     :active, default: true

      t.timestamps
    end
    add_index :workshops, :active
  end
end
