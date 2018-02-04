class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :country
      t.string :organizations, :longitude, :decimal
      t.string :organizations, :latitude, :decimal
      t.string :organizations, :city_and_state, :string

      t.timestamps
    end
  end
end
