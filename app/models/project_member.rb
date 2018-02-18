class ProjectMember < GroupAssociation

  belongs_to :toe_tag, inverse_of: :project_members
  belongs_to :person, inverse_of: :project_members

  belongs_to :lookup_project_member, foreign_type: "LookupProjectMember", class_name: "Lookup", foreign_key: "lookup_id"


end