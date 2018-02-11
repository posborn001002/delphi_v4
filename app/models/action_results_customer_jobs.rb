class ActionResultsCustomerJob < ApplicationRecord

  belongs_to :action_result
  belongs_to :customer_job

end