class CustomerJobUpdate < StatusUpdate

  belongs_to :customer_job, inverse_of: :customer_job_updates
  delegate :job_name,:ref_number,:job_description, to: :customer_job, prefix: false


end
