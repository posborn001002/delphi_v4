class Workshop < ApplicationRecord
  belongs_to :date_lookup
  belongs_to :organization
end
