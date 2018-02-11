class ToeTag < ApplicationRecord
  has_and_belongs_to_many :people, :join_table => 'teams'
  has_many :pain_points, inverse_of: :toe_tag

  belongs_to :organization, inverse_of: :toe_tags
  belongs_to :workshop, inverse_of: :toe_tags

end
