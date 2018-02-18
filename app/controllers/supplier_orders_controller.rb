class SupplierOrdersController < ApplicationController

  before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy, :create]
  before_action :set_edit_parent_from_url, only: [:new,  :edit]
  before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
  before_action :initialize_new_resource, only: [:new]
  before_action :create_new_resource, only: [:create]
  before_action :initialize_resource_collection, only: [:index]

  # GET /supplier_orders
  # GET /supplier_orders.json
  def index
  end

  # GET /supplier_orders/1
  # GET /supplier_orders/1.json
  def show
  end

  # GET /supplier_orders/new
  def new
  end

  # GET /supplier_orders/1/edit
  def edit
  end

  # POST /supplier_orders
  # POST /supplier_orders.json
  def create
    respond_to do |format|
      if @resource.save
        format.html { redirect_to workshop_path( @parent ), notice: 'SupplierOrder successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, notice: 'An error occured!'  }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplier_orders/1
  # PATCH/PUT /supplier_orders/1.json
  def update
    respond_to do |format|
      if @resource.update( supplier_order_params )
        format.html { redirect_to @resource, notice: 'SupplierOrder successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplier_orders/1
  # DELETE /supplier_orders/1.json
  def destroy
    @supplier_order.destroy
    respond_to do |format|
      format.html { redirect_to supplier_orders_url, notice: 'SupplierOrder was successfully destroyed.' }
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
    @resource = SupplierOrder.find( params[:id] )
  end
  def initialize_new_resource
    @resource = @parent.supplier_orders.new
  end
  def initialize_resource_collection
    @resources = @parent.supplier_orders.all.order( :name )
    @supplier_orders = @resources
  end
  def create_new_resource
    @resource = @parent.supplier_orders.new( supplier_order_params )
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def supplier_order_params
    params.require(:supplier_order).permit(
        :process_owner_id,
        :supplier_id,
        :order_name,
        :ref_number,
        :order_description,
        :active
    )
  end

end
