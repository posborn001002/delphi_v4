class Measurement < ApplicationRecord
  belongs_to :date_lookup
  belongs_to :metric
  belongs_to :person
end
