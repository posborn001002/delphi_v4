class Organization < ApplicationRecord
  validates :name, presence: true


  has_many :people
  accepts_nested_attributes_for :people

  has_many :users, inverse_of: :organization

  has_many :workshops
  accepts_nested_attributes_for :workshops

  has_many :toe_tags
  has_many :pain_points

  has_many :customer_associations,  -> {where partner_type: "Customer" }, :class_name => "Customer"
  has_many :customers, :through => :customer_associations, :source => :related_org
  accepts_nested_attributes_for :customers

   has_many :customer_jobs, inverse_of: :organization
   accepts_nested_attributes_for :customer_jobs

  # has_many :inverse_customers, :class_name => "RelatedOrg", :foreign_key => "partner_id"
  # has_many :inverse_related_orgs, :through => :inverse_customers, :source => :organization

  has_many :supplier_associations,  -> {where partner_type: "Supplier" }, :class_name => "Supplier"
  has_many :suppliers, :through => :supplier_associations, :source => :related_org
#  has_many :inverse_customers, :class_name => "RelatedOrg", :foreign_key => "partner_id"
#  has_many :inverse_related_orgs, :through => :inverse_customers, :source => :organization

 # has_many :supplier_orders, through: :suppliers, inverse_of: :organization
  # accepts_nested_attributes_for :customer_jobs

end
