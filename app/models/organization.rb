class Organization < ApplicationRecord
  has_many :people
  has_many :customer_jobs
  has_many :workshops
  accepts_nested_attributes_for :people

#  belongs_to :partner, :polymorphic => true

  has_many  :customers, -> {where organization_type: "Customer" }, foreign_key: :partner_id, foreign_type: :partner_type, join_table: 'related_orgs'
  has_many  :suppliers, -> {where organization_type: "Supplier" }, foreign_key: :partner_id, foreign_type: :partner_type,  join_table: 'related_orgs'

  validates :name, presence: true
end
