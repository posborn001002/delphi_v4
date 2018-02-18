# :nodoc:
class ApplicationController < ActionController::Base

  before_action :authenticate_authorize_user
  protect_from_forgery with: :exception

  def authenticate_authorize_user
  #  :set_gettext_locale
  #  :authenticate_user!
    if current_user != nil
      @my_organization = current_user.organization
      @my_org = current_user.organization.id
    end

    @my_org = 1
    @parent  = Organization.find_by( id: @my_org )
    @my_organization = Organization.find_by( id: @my_org )
    #set a default parent and process owner
    @edit_parent = @parent = @process_owner = ProcessOwner.find_by( id: @my_org ) # if @my_organization.process_owner == true
  end


end
