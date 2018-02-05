class CreateJoinTableTeam < ActiveRecord::Migration[5.1]
  def change
    create_join_table :toe_tags, :people, table_name: :teams do |t|
     t.index :toe_tag_id
     t.index :person_id
     # t.index [:person_id, :toe_tag_id]
    end
  end
end
