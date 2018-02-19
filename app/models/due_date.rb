class DueDate < DateLookup

  has_many :customer_jobs, inverse_of: :order_date

end