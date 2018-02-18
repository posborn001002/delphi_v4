class SupplierOrder < ApplicationRecord
  validates :order_name, presence: true

  belongs_to :process_owner, inverse_of: :supplier_orders
  belongs_to :supplier, foreign_key: 'supplier_id', inverse_of: :supplier_orders

  has_many :action_results_supplier_orders
  has_many :action_results, through: :action_results_supplier_orders, inverse_of: :supplier_orders

  has_many :status_updates, inverse_of: :supplier_order

  has_many :order_contacts, inverse_of: :supplier_order
  has_many :people, through: :order_contacts, inverse_of: :supplier_orders

  def name
    return self.order_name
  end

end
