class CustomerJob < ApplicationRecord
  validates :job_name, presence: true

  belongs_to :process_owner, inverse_of: :customer_jobs

  belongs_to :customer, foreign_key: 'customer_id', inverse_of: :customer_jobs

  has_many :action_results_customer_jobs
  has_many :action_results, through: :action_results_customer_jobs, inverse_of: :customer_jobs

  has_many :customer_job_updates, inverse_of: :customer_job

  has_many :job_contacts, inverse_of: :customer_job
  has_many :people, through: :job_contacts, inverse_of: :customer_jobs

  belongs_to :order_date
  delegate :date, to: :order_date, prefix: true
  belongs_to :due_date
  delegate :date, to: :due_date, prefix: true

  def name
    return self.job_name
  end



end

