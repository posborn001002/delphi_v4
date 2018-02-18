class WorkshopUpdate < StatusUpdate

  belongs_to :workshop, inverse_of: :workshop_updates
  delegate :process_name, to: :workshop, prefix: false, allow_nil: true



end