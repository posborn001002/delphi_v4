class CustomerJobUpdatesController < StatusUpdatesController

  before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy, :create]
  before_action :set_edit_parent_from_url, only: [:new,  :edit]
  before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
  before_action :initialize_new_resource, only: [:new]
  before_action :create_new_resource, only: [:create]
  before_action :initialize_resource_collection, only: [:index]

  # GET /customer_job_updates
  # GET /customer_job_updates.json
  def index
  end

  # GET /customer_job_updates/1
  # GET /customer_job_updates/1.json
  def show
  end

  # GET /customer_job_updates/new
  def new
  end

  # GET /customer_job_updates/1/edit
  def edit
  end

  # POST /customer_job_updates
  # POST /customer_job_updates.json
  def create
    respond_to do |format|
      if @resource.save
        format.html { redirect_to workshop_path( @parent ), notice: 'CustomerJobUpdate successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, notice: 'An error occured!'  }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_job_updates/1
  # PATCH/PUT /customer_job_updates/1.json
  def update
    respond_to do |format|
      if @resource.update( customer_job_update_params )
        format.html { redirect_to @resource, notice: 'CustomerJobUpdate successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_job_updates/1
  # DELETE /customer_job_updates/1.json
  def destroy
    @customer_job_update.destroy
    respond_to do |format|
      format.html { redirect_to customer_job_updates_url, notice: 'CustomerJobUpdate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_parent_from_url
    @parent = CustomerJob.find( params[:customer_job_id] || params[:customer_job][:id] )
  end
  def set_edit_parent_from_url
    @edit_parent = CustomerJob.find( params[:customer_job_id] )
  end
  def initialize_resource
    @resource = CustomerJobUpdate.find( params[:id] )
  end
  def initialize_new_resource
    @resource = @parent.customer_job_updates.new
  end
  def initialize_resource_collection
    @resources = @parent.customer_job_updates.all.order( :name )
    @customer_job_updates = @resources
  end
  def create_new_resource
    @resource = @parent.customer_job_updates.new( customer_job_update_params )
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_job_update_params
    params.require(:customer_job_update).permit(
        :process_owner_id,
        :action_result_id,
        :name,
        :datatype,
        :active
    )
  end


end