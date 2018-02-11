class ActionResult < ApplicationRecord
  belongs_to :organization
  has_many :metrics
  has_and_belongs_to_many :pain_points
  has_many :updates

  has_many :action_results_customer_jobs
  has_many :customer_jobs, :through => :action_results_customer_jobs, inverse_of: :action_results

  belongs_to :workshop, inverse_of: :action_results

end
