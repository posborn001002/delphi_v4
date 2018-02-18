class ToeTag < ApplicationRecord

  has_many :project_members, inverse_of: :toe_tag
  has_many :people, through: :project_members, inverse_of: :toe_tags

  has_many :pain_points, inverse_of: :toe_tag

  belongs_to :workshop, inverse_of: :toe_tags

  has_many :toe_tag_updates, inverse_of: :toe_tag

end
