class ActionResult < ApplicationRecord
  belongs_to :Organization
  has_many :Metrics
  has_and_belongs_to_many :PainPoints
  has_many :Updates


end
