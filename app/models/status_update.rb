class StatusUpdate < ApplicationRecord

  belongs_to :date_lookup
  belongs_to :person, inverse_of: :status_updates
  belongs_to :action_result

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

  def self.sort_by_date( where, limit = 99 )
    # sorts first by date, then by create time (descending)
    StatusUpdate.where( where ).limit( limit ).sort_by{|x| [ Date.today - x.date, DateTime.now.strftime('%N').to_d - x.created_at.strftime('%N').to_d ] }
  end


  def full_name
    self.person.full_name
  end

  def job_order_name
     if self.job_order_type == 'Customer'
         customerjob = CustomerJob.find_by( id: self.job_order_id )
         job_order_name = customerjob.job_name
       elsif self.job_order_type == 'Supplier'
         supplierorder = SupplierOrder.find_by( id: self.job_order_id )
         job_order_name = supplierorder.order_name
     end
    return job_order_name
  end

end
