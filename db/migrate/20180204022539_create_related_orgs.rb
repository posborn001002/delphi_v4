class CreateRelatedOrgs < ActiveRecord::Migration[5.1]
  def change
    create_table :related_orgs do |t|
      t.references     :process_owner
      t.references     :partner, polymorphic: true
    end
  end
end
