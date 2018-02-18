class StatusUpdatesController < ApplicationController

  before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy, :create]
  before_action :set_edit_parent_from_url, only: [:new,  :edit]
  before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
  before_action :initialize_new_resource, only: [:new]
  before_action :create_new_resource, only: [:create]
  before_action :initialize_resource_collection, only: [:index]

  # GET /status_updates
  # GET /status_updates.json
  def index
  end

  # GET /status_updates/1
  # GET /status_updates/1.json
  def show
  end

  # GET /status_updates/new
  def new
  end

  # GET /status_updates/1/edit
  def edit
  end

  # POST /status_updates
  # POST /status_updates.json
  def create
    respond_to do |format|
      if @resource.save
        format.html { redirect_to workshop_path( @parent ), notice: 'StatusUpdate successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, notice: 'An error occured!'  }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_updates/1
  # PATCH/PUT /status_updates/1.json
  def update
    respond_to do |format|
      if @resource.update( status_update_params )
        format.html { redirect_to @resource, notice: 'StatusUpdate successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_updates/1
  # DELETE /status_updates/1.json
  def destroy
    @status_update.destroy
    respond_to do |format|
      format.html { redirect_to status_updates_url, notice: 'StatusUpdate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_parent_from_url
    @parent = Workshop.find( params[:workshop_id] || params[:workshop][:id] )
  end
  def set_edit_parent_from_url
    @edit_parent = Workshop.find( params[:workshop_id] )
  end
  def initialize_resource
    @resource = StatusUpdate.find( params[:id] )
  end
  def initialize_new_resource
    @resource = @parent.status_updates.new
  end
  def initialize_resource_collection
    @resources = @parent.status_updates.all.order( :name )
    @status_updates = @resources
  end
  def create_new_resource
    @resource = @parent.status_updates.new( status_update_params )
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def status_update_params
    params.require(:status_update).permit(
        :process_owner_id,
        :action_result_id,
        :person_id,
        :customer_id,
        :supplier_order_id,
        :customer_job_id,
        :toe_tag_id,
        :pain_point_id,
        :workshop_id,
        :metric_id,
        :type,
        :attachment,
        :text,
        :active
    )
  end

end

#
# class StatusUpdatesController < ApplicationController
#   before_action :set_update, only: [:edit, :show, :delete]
#   before_action :set_parent, only: [:new]
#
#   # GET /updates
#   # GET /updates.json
#   def index
#     if params[:customer_job_id].present?
#       job_order_id = params[:customer_job_id]
#       @job_order_type = 'Customer'
#       @customer_job = CustomerJob.find_by( id: job_order_id )
#     elsif params[:status_update].present?
#       job_order_id = params[:supplier_order_id]
#       @job_order_type = 'Supplier'
#       @supplier_order = SupplierOrder.find_by( id: job_order_id )
#     end
#     @status_updates = StatusUpdate.sort_by_date(["job_order_id = ? and job_order_type = ?", job_order_id, @job_order_type ])
#     @parent = @customer_job || @supplier_order
#   end
#
#   # GET /updates/1
#   # GET /updates/1.json
#   def show
#
#   end
#
#   # GET /updates/new
#   def new
#     @status_update = StatusUpdate.new
#     @status_update.job_order_type = @job_order_type
#     @status_update.job_order_id = @parent.id
#     @author = Person.find_by( id: 1 )
#   end
#
#   # GET /updates/1/edit
#   def edit
#   end
#
#   # POST /updates
#   # POST /updates.json
#   def create
#     @status_update = StatusUpdate.new( update_params )
#     case @status_update.job_order_type
#       when 'Customer' then @customer_job = CustomerJob.find_by( id: @status_update.job_order_id )
#       when 'Supplier' then @supplier_order = SupplierOrder.find( @status_update.job_order_id )
#     end
#
#     respond_to do |format|
#       if @status_update.save
#         format.html { redirect_to @status_update, notice: 'Update was successfully created.' }
#         format.json { render :show, status: :created, location: @status_update }
#       else
#         format.html { render :new }
#         format.json { render json: @status_update.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#   # PATCH/PUT /updates/1
#   # PATCH/PUT /updates/1.json
#   def update
#     respond_to do |format|
#       if @status_update.update(update_params)
#         format.html { redirect_to @status_update, notice: 'Update was successfully updated.' }
#         format.json { render :show, status: :ok, location: @status_update }
#       else
#         format.html { render :edit }
#         format.json { render json: @status_update.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#   # DELETE /updates/1
#   # DELETE /updates/1.json
#   def destroy
#     @status_update.destroy
#     respond_to do |format|
#       format.html { redirect_to updates_url, notice: 'Update was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end
#
#
#
#
#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_update
#       @status_update = StatusUpdate.find_by( id: params[:id])
#       case @status_update.job_order_type
#         when 'Customer' then @customer_job = CustomerJob.find( @status_update.job_order_id )
#         when 'Supplier' then @supplier_order = SupplierOrder.find( @status_update.job_order_id )
#       end
#       @parent = @customer_job || @supplier_order
#     end
#     def set_parent
#       if params[:customer_job_id].present?
#         customer_job_id = params[:customer_job_id]
#         @job_order_type = 'Customer'
#         @customer_job = CustomerJob.find_by( id: customer_job_id )
#         @status_update = @customer_job.status_updates.new
#       elsif params[:status_update].present?
#              customer_job_id = params[:customer_job_id]
#              @job_order_type = 'Customer'
#              @customer_job = CustomerJob.find_by( id: customer_job_id )
#              @status_update = @customer_job.status_updates.new
#       elsif params[:supplier_order_id].present?
#              supplier_order_id = params[:supplier_order_id]
#              @job_order_type = 'Supplier'
#              @supplier_order = SupplierOrder.find_by( id: supplier_order_id )
#              @status_update = @supplier_order.status_updates.new
#       elsif params[:status_update].present?
#              supplier_order_id = params[:supplier_order_id]
#              @job_order_type = 'Supplier'
#              @supplier_order = SupplierOrder.find_by( id: supplier_order_id )
#              @status_update = @supplier_order.status_updates.new
#       end
#       @parent = @customer_job || @supplier_order
#     end
#
#     # Never trust parameters from the scary internet, only allow the white list through.
#     def update_params
#       params.require(:status_update).permit(:date,
#                                             :customer_job_id,
#                                             :supplier_order_id,
#                                             :date_lookup_id,
#                                             :person_id,
#                                             :action_result_id,
#                                             :job_order_id,
#                                             :job_order_type,
#                                             :attachment,
#                                             :text)
#     end
#     def customer_job_params
#       params.require(:customer_job).permit()
#     end
#     def supplier_order_params
#       params.require(:supplier_order).permit()
#     end
#
#
# end
