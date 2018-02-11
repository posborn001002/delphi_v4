class DateLookup < ApplicationRecord
  has_many :workshops, inverse_of: :date_lookup

end
