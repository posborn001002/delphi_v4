class Update < ApplicationRecord
  belongs_to :DateLookup
  belongs_to :Person
  belongs_to :ActionResult
  belongs_to :CustomerJob
  belongs_to: SupplierOrder
end
