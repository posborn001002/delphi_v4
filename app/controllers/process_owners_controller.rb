class ProcessOwnersController < OrganizationsController
  # only users who belong to a Delphi Process

  before_action :set_process_owner, only: [:edit, :show, :update, :destroy]

  # GET /process_owners
  # GET /ProcessOwners.json
  def index
    @resources = ProcessOwner.all.where( {process_owner: true} )
  end


  # GET /ProcessOwners/1
  # GET /process_owners/1.json
    def show
      @people = @resource.people.all
      @workshops = @resource.workshops.all
      @customers = @resource.customers.all
      @customer_jobs = @resource.customer_jobs.all
      @suppliers = @resource.suppliers.all
      @supplier_orders = @resource.supplier_orders.all
    end

  # GET /process_owners/new
  def new
    @resource = ProcessOwner.new
    #  @person = @resource.people.build
  end

  # GET /process_owners/1/edit
  def edit
  end

  # POST /process_owners/
  # POST /process_owners.json
  def create
    @resource = ProcessOwner.create( permitted_params )

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /process_owners/1
  # PATCH/PUT /process_owners/1.json
  def update
    respond_to do |format|
      if @resource.update( permitted_params )
        format.html { redirect_to @resource, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /process_owners/1
  # DELETE /process_owners/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to process_owners_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_process_owner
    @resource = ProcessOwner.find_by( id: params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def permitted_params
    params.require(:process_owner).permit(
        :name,
        :address1,
        :address2,
        :city,
        :state,
        :country,
        :city_and_state,
        :latitude,
        :longitude,
        people_attributes: [
            :first_name,
            :last_name,
            :telephone,
            :job_title
        ],
        user_attributes: [
            :email,
            :password
        ]
    )
  end


end