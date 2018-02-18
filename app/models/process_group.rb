class ProcessGroup  < GroupAssociation

    belongs_to :action_result, inverse_of: :process_groups
    belongs_to :person, inverse_of: :process_groups

    belongs_to :lookup_process_role, foreign_type: "LookupProcessRole", class_name: "Lookup", foreign_key: "lookup_id"

  end

end