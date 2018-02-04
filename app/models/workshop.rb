class Workshop < ApplicationRecord
  belongs_to :DateLookup
  belongs_to :Organization
end
