class Organization < ApplicationRecord
  validates :name, presence: true
  self.inheritance_column = :_type_disabled

  ## THIS WORKS - creates a user, a person, and an ProcessOwner
  # user_2 = User.create( { email: 'brae@obmfg.com', password: 'letmein',
  # person_attributes: { first_name: 'Brian', last_name: 'Rae', job_title: 'Operations Manager', telephone: '123-456',
  # 	ProcessOwner_attributes: { name: 'Out of The Box Manufacturing', address1: '1600 SW 43rd St Suite 200', city: 'Renton', state: 'WA', zip: '98057', country: 'United States'}
  # 	}
  # } )
  #

  has_many :people, inverse_of: :organization
  accepts_nested_attributes_for :people

  has_many :users, through: :people, inverse_of: :organization
   accepts_nested_attributes_for :users


end
