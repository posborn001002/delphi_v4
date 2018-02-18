class OrderContact

  belongs_to :supplier_order, inverse_of: :order_contacts
  belongs_to :person, inverse_of: :order_contacts

end