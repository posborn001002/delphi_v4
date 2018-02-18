class CustomerUpdate < StatusUpdate

  belongs_to :customer, inverse_of: :customer_updates
  delegate :name, to: :customer, prefix: false


end