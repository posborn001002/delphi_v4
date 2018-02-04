class CreateJoinTableOrganizationRelationship < ActiveRecord::Migration[5.1]
  def change
    create_join_table :organization_relationships do |t|
      t.index :process_owner_id
      t.index :organization_id
      t.string :relationship_type
      # t.index [:organization_id, :organization_id]
    end
  end
end
