class StatusUpdatesController < ApplicationController
  before_action :set_update, only: [:edit, :show, :delete]
  before_action :set_parent, only: [:new]

  # GET /updates
  # GET /updates.json
  def index
    if params[:customer_job_id].present?
      job_order_id = params[:customer_job_id]
      @job_order_type = 'Customer'
      @customer_job = CustomerJob.find_by( id: job_order_id )
    elsif params[:status_update].present?
      job_order_id = params[:supplier_order_id]
      @job_order_type = 'Supplier'
      @supplier_order = SupplierOrder.find_by( id: job_order_id )
    end
    @status_updates = StatusUpdate.sort_by_date(["job_order_id = ? and job_order_type = ?", job_order_id, @job_order_type ])
    @parent = @customer_job || @supplier_order
  end

  # GET /updates/1
  # GET /updates/1.json
  def show

  end

  # GET /updates/new
  def new
    @status_update = StatusUpdate.new
    @status_update.job_order_type = @job_order_type
    @status_update.job_order_id = @parent.id
    @author = Person.find_by( id: 1 )
  end

  # GET /updates/1/edit
  def edit
  end

  # POST /updates
  # POST /updates.json
  def create
    @status_update = StatusUpdate.new( update_params )
    case @status_update.job_order_type
      when 'Customer' then @customer_job = CustomerJob.find_by( id: @status_update.job_order_id )
      when 'Supplier' then @supplier_order = SupplierOrder.find( @status_update.job_order_id )
    end

    respond_to do |format|
      if @status_update.save
        format.html { redirect_to @status_update, notice: 'Update was successfully created.' }
        format.json { render :show, status: :created, location: @status_update }
      else
        format.html { render :new }
        format.json { render json: @status_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /updates/1
  # PATCH/PUT /updates/1.json
  def update
    respond_to do |format|
      if @status_update.update(update_params)
        format.html { redirect_to @status_update, notice: 'Update was successfully updated.' }
        format.json { render :show, status: :ok, location: @status_update }
      else
        format.html { render :edit }
        format.json { render json: @status_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    @status_update.destroy
    respond_to do |format|
      format.html { redirect_to updates_url, notice: 'Update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_update
      @status_update = StatusUpdate.find_by( id: params[:id])
      case @status_update.job_order_type
        when 'Customer' then @customer_job = CustomerJob.find( @status_update.job_order_id )
        when 'Supplier' then @supplier_order = SupplierOrder.find( @status_update.job_order_id )
      end
      @parent = @customer_job || @supplier_order
    end
    def set_parent
      if params[:customer_job_id].present?
        customer_job_id = params[:customer_job_id]
        @job_order_type = 'Customer'
        @customer_job = CustomerJob.find_by( id: customer_job_id )
        @status_update = @customer_job.status_updates.new
      elsif params[:status_update].present?
             customer_job_id = params[:customer_job_id]
             @job_order_type = 'Customer'
             @customer_job = CustomerJob.find_by( id: customer_job_id )
             @status_update = @customer_job.status_updates.new
      elsif params[:supplier_order_id].present?
             supplier_order_id = params[:supplier_order_id]
             @job_order_type = 'Supplier'
             @supplier_order = SupplierOrder.find_by( id: supplier_order_id )
             @status_update = @supplier_order.status_updates.new
      elsif params[:status_update].present?
             supplier_order_id = params[:supplier_order_id]
             @job_order_type = 'Supplier'
             @supplier_order = SupplierOrder.find_by( id: supplier_order_id )
             @status_update = @supplier_order.status_updates.new
      end
      @parent = @customer_job || @supplier_order
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_params
      params.require(:status_update).permit(:date,
                                            :customer_job_id,
                                            :supplier_order_id,
                                            :date_lookup_id,
                                            :person_id,
                                            :action_result_id,
                                            :job_order_id,
                                            :job_order_type,
                                            :attachment,
                                            :text)
    end
    def customer_job_params
      params.require(:customer_job).permit()
    end
    def supplier_order_params
      params.require(:supplier_order).permit()
    end


end
