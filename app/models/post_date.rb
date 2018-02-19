class PostDate

  has_many :status_updates, inverse_of: :post_date
  delegate :date, to: :status_updates, prefix: true

end