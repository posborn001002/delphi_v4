class ProcessOwnerController < ApplicationController
  #only users who belong to a Delphi Process
  #
#  before_action :ensure_process_owner!

  private

  def ensure_process_owner!
    unless current_user.organization.process_owner?
      redirect_to root_path
    end
  end
end