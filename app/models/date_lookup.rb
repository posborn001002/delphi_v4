class DateLookup < ApplicationRecord

  has_many :workshops, inverse_of: :date_lookup
 #   delegate  :date, to: :workshops, prefix: false
  has_many :status_updates, inverse_of: :date_lookup
  #  delegate :date, to: :status_updates, prefix: false

end
