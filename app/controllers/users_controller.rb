class UsersController < ActiveRecord::Base

  after_create :setup_person

  def setup_person
    redirect_to 'organizations/form'
  end

end