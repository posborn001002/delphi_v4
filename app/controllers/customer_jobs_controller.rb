class CustomerJobsController < ApplicationController

  before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy, :create]
  before_action :set_edit_parent_from_url, only: [:new,  :edit]
  before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
  before_action :initialize_new_resource, only: [:new]
  before_action :create_new_resource, only: [:create]
  before_action :initialize_resource_collection, only: [:index]

  # GET /customer_jobs
  # GET /customer_jobs.json
  def index
  end

  # GET /customer_jobs/1
  # GET /customer_jobs/1.json
  def show
  end

  # GET /customer_jobs/new
  def new
  end

  # GET /customer_jobs/1/edit
  def edit
  end

  def confirm
  end

  # POST /customer_jobs
  # POST /customer_jobs.json
  def create
    respond_to do |format|
      if @resource.save
        format.html { redirect_to process_owner_customer_job_confirm_path( @parent, @resource ), notice: 'Customer Job successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, notice: 'An error occured!'  }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_jobs/1
  # PATCH/PUT /customer_jobs/1.json
  def update
    respond_to do |format|
      if @resource.update( customer_job_params )
        format.html { redirect_to process_owner_path( @parent ), notice: 'Customer Job successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_jobs/1
  # DELETE /customer_jobs/1.json
  def destroy
    @customer_job.destroy
    respond_to do |format|
      format.html { redirect_to customer_jobs_url, notice: 'Customer Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_parent_from_url
    @parent = ProcessOwner.find( params[:process_owner_id] || params[:process_owner][:id] )
  end
  def set_edit_parent_from_url
    @edit_parent = ProcessOwner.find( params[:process_owner] || params[:process_owner_id]  || params[:process_owner][:id] )
  end
  def initialize_resource
    @resource = CustomerJob.find( params[:id] )
  end
  def initialize_new_resource
    @resource = @parent.customer_jobs.new
  end
  def initialize_resource_collection
    @resources = @parent.customer_jobs.all.order( :job_name )
    @customer_jobs = @resources
  end
  def create_new_resource
    @resource = @parent.customer_jobs.new( customer_job_params )
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_job_params
    params.require(:customer_job).permit(
        :job_name,
        :process_owner_id,
        :customer_id,
        :job_description,
        :ref_number,
        :active
    )
  end

  def customer_params
    params.require( :customer).permit(
        :id,
        :partner_id
    );
  end
  def process_owner_params
    params.require( :process_owner).permit(
        :id
    );
  end

end
