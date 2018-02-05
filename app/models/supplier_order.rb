class SupplierOrder < ApplicationRecord
  has_and_belongs_to_many :organizations, join_table => 'related_orgs'
  has_many :contacts
  has_many :updates
  has_many :action_results
end
