class CustomersController < OrganizationsController

  before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy, :create]
  before_action :set_edit_parent_from_url, only: [:new,  :edit]
  before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
  before_action :initialize_new_resource, only: [:new]
  before_action :create_new_resource, only: [:create]
  before_action :initialize_resource_collection, only: [:index]

  # GET process_owners/1/customers
  def index
  end

  # GET process_owners/1/customers/4
  def show
  end

  # GET process_owners/1/customers/new
  def new
  end

  # GET process_owners/1/customers/4/edit
  def edit

  end

  # POST /process_owners/1/customers/4/create
  def create
    if !!params[:customer][:id].present? then
      @sql = RelatedOrg.create( { partner_id: params[:customer][:id], process_owner_id: @parent.id, partner_type: 'Customer' } )
      @resource = @parent.customers.last
    else
      @resource = @parent.customers.create( customer_params )
    end
    respond_to do |format|
      if @resource.save
        format.html { redirect_to process_owner_path( @parent ), notice: 'Customer successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new  }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @resource.update( customer_params )
        format.html { redirect_to process_owner_path( @parent ), notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @resource = @parent.customers.find( params[:id])
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to process_owner_path( @parent ), notice: 'customer was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_parent_from_url
    @parent = ProcessOwner.find( params[:process_owner_id] || params[:process_owner][:id] )
  end
  def set_edit_parent_from_url
    @edit_parent = ProcessOwner.find( params[:process_owner_id] )
  end
  def initialize_resource
    @resource = Customer.find( params[:id] )
  end
  def initialize_new_resource
    @resource = @parent.customers.new
  end
  def initialize_resource_collection
    @resources = @parent.customers.all
  end
  def create_new_resource
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(
        :id,
        :partner_id,
        :process_owner_id,
        :partner_type,
        :name,
        :address1,
        :address2,
        :city,
        :state,
        :country,
        :city_and_state,
        :latitude,
        :longitude
    )
  end

  def process_owner_params
    params.require(:process_owner).permit(
        :id
    );
  end

end
