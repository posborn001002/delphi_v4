class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.decimal :longitude, column_options: { precision: 6, scale: 4 }
      t.decimal :latitude, column_options: { precision: 7, scale: 4 }
      t.string :city_and_state
      t.boolean :active,  default: true
      t.boolean :process_owner, default: false

      t.timestamps
    end
    add_index :organizations, :active
    add_index :organizations, :process_owner
  end
end
