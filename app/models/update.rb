class Update < ApplicationRecord
  belongs_to :date_lookup
  belongs_to :person
  belongs_to :action_result
  belongs_to :customer_job
  belongs_to :supplier_order
end
