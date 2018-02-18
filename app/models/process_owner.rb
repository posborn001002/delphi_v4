class ProcessOwner < Organization
  self.inheritance_column = :_type_disabled

  has_many :related_orgs
  has_many :customers, through: :related_orgs, source: :partner, source_type: 'Customer'
  accepts_nested_attributes_for :customers

  has_many :suppliers, through: :related_orgs, source: :partner, source_type: 'Supplier'
  accepts_nested_attributes_for :suppliers

  has_many :customer_jobs, inverse_of: :process_owner
  accepts_nested_attributes_for :customer_jobs

  has_many :supplier_orders, inverse_of: :process_owner
  accepts_nested_attributes_for :supplier_orders


  has_many :workshops
  accepts_nested_attributes_for :workshops

  has_many :toe_tags

  has_many :pain_points

  has_many :process_owner_updates, inverse_of: :process_owner

  attr_accessor :non_customers, :non_suppliers

  def non_customers
    array = []
    array = ( !!self.customers.empty? ? [] : self.customers.map(&:id) )
    array << self.id
    self.non_customers = Organization.where.not( id: array).order( name: :asc )
  end

  def non_suppliers
    array = []
    array = ( !!self.suppliers.empty? ? [] : self.suppliers.map(&:id) )
    array << self.id
    self.non_suppliers = Organization.where.not( id: array).order( name: :asc )
  end

end