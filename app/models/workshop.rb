class Workshop < ApplicationRecord

  belongs_to :date_lookup
  belongs_to :process_owner

  has_many :triagers, inverse_of: :workshop
  has_many :people, through: :triagers, inverse_of: :workshops

  has_many :action_results, inverse_of: :workshop

  has_many :toe_tags, inverse_of: :workshop

  has_many :workshop_updates, inverse_of: :workshop

  has_many :pain_points, through: :toe_tags, inverse_of: :workshop


end
