class CreateJoinTableToeTagPainPoint < ActiveRecord::Migration[5.1]
  def change
    create_join_table :toe_tags, :pain_points do |t|
      # t.index [:toe_tag_id, :pain_point_id]
      # t.index [:pain_point_id, :toe_tag_id]
    end
  end
end
