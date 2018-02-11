class Supplier < ActiveRecord::Base
  self.table_name = 'related_orgs'
#  belongs_to :organization
  belongs_to :related_org,  :class_name => "Organization", foreign_key: 'partner_id'


end