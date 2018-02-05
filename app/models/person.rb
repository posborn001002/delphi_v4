class Person < ApplicationRecord
  belongs_to :organization
  has_one :user
  accepts_nested_attributes_for :organization
  validates_associated :organization

  has_many :Measurements
#  has_many :Workshops, through attendees
 has_and_belongs_to_many :toe_tags, :join_table => 'teams'

  validates :first_name, :last_name, :email,  presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def organization_name=( name )
    self.organization = Organization.find_or_create_by( name: name )
  end


end
