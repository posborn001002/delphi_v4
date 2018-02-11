class SessionsController < Devise::SessionsController

 # after_commit :setup_user

  def create
    redirect_to organizations_path, notice: 'Person was successfully created.'
  end

end