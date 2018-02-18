class SupplierOrderUpdate < StatusUpdate

  belongs_to :supplier_order, inverse_of: :order_updates
  delegate :order_name, :ref_number,:order_description, to: :status_updates, prefix: false


end