class Person < ApplicationRecord
  belongs_to :Organization
  has_one :User
  accepts_nested_attributes_for :organization
  validates_associated :organization

  has_many :Measurements
  has_many :workshops, through :Attendee
  has_many :ToeTags, through :Team

  validates :first_name, :last_name, :email,  presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def organization_name=( name )
    self.organization = Organization.find_or_create_by( name: name )
  end


end
