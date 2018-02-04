class Measurement < ApplicationRecord
  belongs_to :DateLookup
  belongs_to :Metric
  belongs_to :Person
end
