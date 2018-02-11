# :nodoc:
class ApplicationController < ActionController::Base

  before_action :authenticate_authorize_user
  protect_from_forgery with: :exception

  def authenticate_authorize_user
    :set_gettext_locale
  #  :authenticate_user!
  #  if current_user != nil
  #    @organization = current_user.organization
  #    @org_id = current_user.organization.id
   # end
    @org_id = 1
    @organization = Organization.find_by( id: @org_id )
  end

end
