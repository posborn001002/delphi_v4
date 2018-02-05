class CustomerJob < ApplicationRecord
  belongs_to :organization
  has_many :contacts
  has_many :updates
  has_many :action_results

  validates :job_name, presence: true

end
