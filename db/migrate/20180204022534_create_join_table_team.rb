class CreateJoinTableTeam < ActiveRecord::Migration[5.1]
  def change
    create_join_table :teams do |t|
      t.index [:toe_tag_id, :person_id]
      t.index [:person_id, :toe_tag_id]
    end
  end
end
