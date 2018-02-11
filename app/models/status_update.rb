class StatusUpdate < ApplicationRecord

  belongs_to :date_lookup
  belongs_to :person, inverse_of: :updates
  belongs_to :action_result
  belongs_to :supplier_order

  belongs_to :job_order, polymorphic: true

  # belongs_to :customer_job, -> {where 'job_order_type = Customer'}, foreign_key: 'job_order_id', inverse_of: :status_updates
  # belongs_to :supplier_order, -> {where 'job_order_type = Supplier'}, foreign_key: 'job_order_id', inverse_of: :status_updates

  accepts_nested_attributes_for :date_lookup

  def date=( newdate )
    @date = DateLookup.find_by( date: newdate )
    self.date_lookup = @date
  end

  def date
    self.date_lookup.date
  end

end
