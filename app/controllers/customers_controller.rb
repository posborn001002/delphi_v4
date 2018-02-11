class CustomersController < ApplicationController
  include InitializeOrganization

  before_action :set_organization, only: [:index, :new]
  before_action :set_customer_and_organization, only: [:show, :update, :destroy]
  before_action :set_customer, only: [:edit]
  before_action :set_org_id, only: [:create]


  # GET /customers.json

  # GET organizations/1/customers
  def index
    @customers = @organization.customers.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET organization/1/customers/new
  #
  def new
    @customer = Customer.new
    # create an array of current customers so we don't add them in again....
    array = ( !!@organization.customers.empty? ? [] : @organization.customers.map(&:id) ) << @organization.id
    @dropdown = Organization.where.not( id: array).order( name: :asc )

  end
  # GET /customers/1/edit
  # organizations/16/customers/11/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create

    @organization = Organization.find( organization_params[:id] )
    if !params[:customer][:id].empty?
      @partner = Organization.find( customer_params[:id] )
    else
      @partner = Organization.create( customer_params )
    end
    @customer = Customer.new( partner_id: @partner.id, organization_id: @org_id, partner_type: 'Customer' )


    respond_to do |format|
      if @customer.save
        format.html { redirect_to organization_path( @organization ), notice: 'customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        #  organization = Organization.create( customer_params[:organization_attributes] )
        # @customer = organization.customers.build( customer_params )
        format.html { render :new  }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update( customer_params )
        format.html { redirect_to organization_path( @organization ), notice: 'customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = @organization.customers.find( params[:id])
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to organization_path( @organization ), notice: 'customer was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  #  Ser customer applies to everthing except 'new'
  # Set organization should not be done for 'edit' because routing is not set up (shallow) f
  # params[:organization_id] || organization_params[:id] || @customer.organization_id
  # params[:organization_is] is set when we come here from an organization
  # organization_params is set after editing
  # if jsut coming here from a customer, then @customer.organization_id is set.
  def set_customer
    @customer = Customer.find( params[:id] )
    @org_id = @customer.organization_id
  end
  def set_organization
    @organization = Organization.find( params[:organization_id] )
    @org_id = @organization.id
  end
  def set_customer_and_organization
    set_customer()
    @organization = Organization.find( @customer.organization_id )
  end
  def set_org_id
    @org_id =  params[:organization_id] || organization_params[:id]
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:id, :partner_id, :organization_id, :partner_type, :name, :address1, :address2, :city, :state, :city_and_state, :latitude, :longitude, :country)
  end

  def organization_params
    params.require(:organization).permit(:id );
  end

end
