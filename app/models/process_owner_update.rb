class ProcessOwnerUpdate < StatusUpdate

  belongs_to :process_owner, inverse_of: :process_owner_updates
  delegate  :name, to: :process_owner, prefix: false

end