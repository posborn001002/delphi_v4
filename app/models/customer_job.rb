class CustomerJob < ApplicationRecord
  validates :job_name, presence: true

  belongs_to :organization, inverse_of: :customer_jobs
  belongs_to :customer, foreign_key: 'customer_id', primary_key: 'partner_id', inverse_of: 'customer_jobs'
 # has_many :contacts


  has_many :action_results_customer_jobs
  has_many :action_results, :through => :action_results_customer_jobs, inverse_of: :customer_jobs

  has_many :status_updates, as: :job_order

  def name
    return self.job_name
  end


end