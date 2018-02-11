# :nodoc:
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  scope :active, -> { where( active: true ) }
  scope :process_owner, -> {where( :organization == current_user.organization )}


end
