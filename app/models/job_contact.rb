class JobContact < GroupAssociation

  belongs_to :customer_job, inverse_of: :job_contacts
  belongs_to :person, inverse_of: :job_contacts

end