class MetricsController < ApplicationController

  before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy, :create]
  before_action :set_edit_parent_from_url, only: [:new,  :edit]
  before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
  before_action :initialize_new_resource, only: [:new]
  before_action :create_new_resource, only: [:create]
  before_action :initialize_resource_collection, only: [:index]

  # GET /metrics
  # GET /metrics.json
  def index
  end

  # GET /metrics/1
  # GET /metrics/1.json
  def show
  end

  # GET /metrics/new
  def new
  end

  # GET /metrics/1/edit
  def edit
  end

  # POST /metrics
  # POST /metrics.json
  def create
    respond_to do |format|
      if @resource.save
        format.html { redirect_to workshop_path( @parent ), notice: 'Metric successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, notice: 'An error occured!'  }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metrics/1
  # PATCH/PUT /metrics/1.json
  def update
    respond_to do |format|
      if @resource.update( metric_params )
        format.html { redirect_to @resource, notice: 'Metric successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metrics/1
  # DELETE /metrics/1.json
  def destroy
    @metric.destroy
    respond_to do |format|
      format.html { redirect_to metrics_url, notice: 'Metric was successfully destroyed.' }
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
    @resource = Metric.find( params[:id] )
  end
  def initialize_new_resource
    @resource = @parent.metrics.new
  end
  def initialize_resource_collection
    @resources = @parent.metrics.all.order( :name )
    @metrics = @resources
  end
  def create_new_resource
    @resource = @parent.metrics.new( metric_params )
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def metric_params
    params.require(:metric).permit(
        :process_owner_id,
        :action_result_id,
        :name,
        :datatype,
        :active
    )
  end

end
