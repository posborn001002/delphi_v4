class ActionResult < ApplicationRecord
  belongs_to :organization
  has_many :metrics
  has_and_belongs_to_many :pain_points
  has_many :updates


end
