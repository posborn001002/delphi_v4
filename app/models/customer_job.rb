class CustomerJob < ApplicationRecord
  belongs_to :OrganizationRelationship
  has_many :Contacts
  has_many :Updates
  has_many :ActionResults, through :action_results_customer_jobs

  validates :job_name, presence: true

end
