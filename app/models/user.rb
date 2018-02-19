class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

## THIS WORKS - creates a user, a person, and an ProcessOwner
# user_2 = User.create( { email: 'brae@obmfg.com', password: 'letmein',
# person_attributes: { first_name: 'Brian', last_name: 'Rae', job_title: 'Operations Manager', telephone: '123-456',
# 	ProcessOwner_attributes: { name: 'Out of The Box Manufacturing', address1: '1600 SW 43rd St Suite 200', city: 'Renton', state: 'WA', zip: '98057', country: 'United States'}
# 	}
# } )

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :person, inverse_of: :user
    accepts_nested_attributes_for :person

  has_one :organization, through: :person

  def remember_me
    (super == nil) ? '1' : super
  end

end
