class Supplier < Organization
  self.inheritance_column = :_type_disabled

  has_many :related_orgs, as: :partner
  has_many :process_owners, through: :related_orgs

  has_many :supplier_orders, primary_key: 'partner_id', foreign_key: 'supplier_id'
    accepts_nested_attributes_for :supplier_orders


  has_many :supplier_updates, inverse_of: :supplier

end