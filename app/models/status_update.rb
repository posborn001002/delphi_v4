class StatusUpdate < ApplicationRecord

  belongs_to :date_lookup, inverse_of: :status_updates
  belongs_to :person, inverse_of: :status_updates

  attr_accessor :author, :post_date

  def post_date=( newdate )
     self.date_lookup = DateLookup.find_by( date: newdate )
  end

  def post_date
    self.date_lookup.date
  end

  def self.sort_by_date( )
    # sorts first by date, then by create time (descending)
    self.all.sort_by{ |x| [ Date.today - x.post_date, DateTime.now.strftime('%N').to_d - x.created_at.strftime('%N').to_d ] }
  end

  def author
   # self.person.full_name
  end

end
