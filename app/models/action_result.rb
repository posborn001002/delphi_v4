class ActionResult < ApplicationRecord

  belongs_to :process_owner

  belongs_to :workshop, inverse_of: :action_results

  has_many :metrics
  has_many :pain_points, inverse_of: :action_result

  has_many :action_result_updates, inverse_of: :action_result
  # delegate :ar_number, to: :action_result_updates, prefix: false
 #  delegate :action, to: :action_result_updates, prefix: false
 #  delegate :result, to: :action_result_updates, prefix: false

  has_many :action_results_customer_jobs
  has_many :customer_jobs, through: :action_results_customer_jobs, inverse_of: :action_results

  has_many :action_results_supplier_orders
  has_many :supplier_orders, through: :action_results_supplier_orders, inverse_of: :action_results


end
