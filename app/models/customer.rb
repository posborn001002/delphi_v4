class Customer < ApplicationRecord
  self.table_name = 'related_orgs'

  has_one :organization, foreign_key: 'id', primary_key: 'partner_id', inverse_of: 'customer_record'
  belongs_to :related_org,  :class_name => "Organization", foreign_key: 'partner_id'

  has_many :customer_jobs, primary_key: 'partner_id', foreign_key: 'customer_id'
  accepts_nested_attributes_for :customer_jobs


end