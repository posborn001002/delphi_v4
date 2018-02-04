class Metric < ApplicationRecord
  belongs_to :ActionResult
  belongs_to :ToeTag
  has_many :Metrics
end
