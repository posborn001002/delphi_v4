class SupplierOrder < ApplicationRecord
  belongs_to :OrganizationRelationship
  has_many :Contacts
  has_many :Updates
  has_many :ActionResults, through :action_results_supplier_orders
end
