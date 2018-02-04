class CreateJoinTableAttendee < ActiveRecord::Migration[5.1]
  def change
    create_join_table :attendees do |t|
       t.index [:workshop_id, :person_id]
       t.index [:person_id, :workshop_id]
    end
  end
end
