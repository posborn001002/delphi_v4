class RelatedOrg < ApplicationRecord

  belongs_to :partner, polymorphic: true
  belongs_to :process_owner

end