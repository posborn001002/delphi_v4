class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :person, inverse_of: :user
  has_one :organization, :through => :people

  def remember_me
    (super == nil) ? '1' : super
  end




end
