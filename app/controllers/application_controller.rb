class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!
  
  before_action :set_gettext_locale

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :setup_user

  def setup_user
    if user_signed_in?
    #   @my_organization = current_user.organization
       @my_org = 1 #current_user.organization.id
      # set a default parent and process owner
       @edit_parent = @parent = @process_owner = ProcessOwner.find_by( id: @my_org ) # if @my_organization.process_owner == true
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :telephone, :organization_id ] )
  end

end


