module InitializeOrganization
  extend ActiveSupport::Concern



  def set_organization(  )
    @organization = case @type
                      when 'fromOrg' then Organization.find( params[:organization_id] )
                      when 'fromEntity' then Organization.find( @entity.organization_id  )
                      when 'fromEdit' then Organization.find( organization_params[:id] )
                    end
    @org_id = @organization.id
  end

  def set_org_id()
    @org_id = case @type
      when 'toEdit' then @entity.organization_id
      end
  end
end