class SupplierUpdate < StatusUpdate

  belongs_to :supplier, inverse_of: :supplier_updates

end