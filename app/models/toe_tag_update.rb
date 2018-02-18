class ToeTagUpdate < StatusUpdate

  belongs_to :toe_tag, inverse_of: :toe_tag_updates
  delegate :priority, :big_small_now, :solution, :status_update, :success_measurement, :lookup_solution_type, to: :toe_tag, prefix: false

end