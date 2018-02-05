class CreateJoinTableOrganizationRelationship < ActiveRecord::Migration[5.1]
  def change
    create_table :related_orgs, id: false do |t|
      t.references     :organization
      t.references     :partner, polymorphic: true
    end
  end
end
