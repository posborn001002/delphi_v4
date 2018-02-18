class Customer < Organization
  self.inheritance_column = :_type_disabled

  has_many :related_orgs,  as: :partner
  has_many :process_owners, through: :related_orgs

  has_many :customer_jobs, primary_key: 'partner_id', foreign_key: 'customer_id'
    accepts_nested_attributes_for :customer_jobs

  has_many :customer_updates, inverse_of: :customer

end