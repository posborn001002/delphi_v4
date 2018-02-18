class Triager < GroupAssociation

  belongs_to :workshop, inverse_of: :triagers
  belongs_to :person, inverse_of: :triagers

  belongs_to :lookup_workshop_role, foreign_type: "LookupWorkshopRole", class_name: "Lookup", foreign_key: "lookup_id"

end