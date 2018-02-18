class Person < ApplicationRecord
  # don't add validation, otherwise creation of user as
  #  validates :first_name, :last_name, presence: true
  #

 #  validates_associated :organization, :user, presence: true

 # validates :email, uniqueness: { case_sensitive: false }

  belongs_to :organization, inverse_of: :people
    accepts_nested_attributes_for :organization

  belongs_to :user, inverse_of: :person

  has_many :measurements

  has_many :triagers, foreign_key: 'person_id'
  has_many :workshops, through: :triagers
  has_many :job_contacts, foreign_key: 'person_id'
  has_many :customer_jobs, through: :job_contacts
  has_many :order_contacts, foreign_key: 'person_id'
  has_many :supplier_orders, through: :order_contacts
  has_many :project_members, foreign_key: 'person_id'
  has_many :toe_tags, through: :project_members
  has_many :process_groups, foreign_key: 'person_id'
  has_many :action_results, through: :process_groups


  def organization_name=( name )
    self.organization = Organization.find_or_create_by( name: name )
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end

   def email
     self.user.email
   end

  has_many :status_updates, inverse_of: :person

  has_many :job_contacts, inverse_of: :person

end
