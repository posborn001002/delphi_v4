class Person < ApplicationRecord
  belongs_to :organization
  belongs_to :user, inverse_of: :person
  accepts_nested_attributes_for :organization
  validates_associated :organization
  accepts_nested_attributes_for :user

  has_many :Measurements
#  has_many :Workshops, through attendees
 has_and_belongs_to_many :toe_tags, :join_table => 'teams'

  validates :first_name, :last_name, :email,  presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def organization_name=( name )
    self.organization = Organization.find_or_create_by( name: name )
  end


  has_many :updates, inverse_of: :person

  has_many :job_contacts, inverse_of: :person

end
