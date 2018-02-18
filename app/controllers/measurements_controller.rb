class MeasurementsController < ApplicationController

  before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy, :create]
  before_action :set_edit_parent_from_url, only: [:new,  :edit]
  before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
  before_action :initialize_new_resource, only: [:new]
  before_action :create_new_resource, only: [:create]
  before_action :initialize_resource_collection, only: [:index]

  # GET /measurements
  # GET /measurements.json
  def index
  end

  # GET /measurements/1
  # GET /measurements/1.json
  def show
  end

  # GET /measurements/new
  def new
  end

  # GET /measurements/1/edit
  def edit
  end

  # POST /measurements
  # POST /measurements.json
  def create
    respond_to do |format|
      if @resource.save
        format.html { redirect_to workshop_path( @parent ), notice: 'Measurement successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, notice: 'An error occured!'  }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurements/1
  # PATCH/PUT /measurements/1.json
  def update
    respond_to do |format|
      if @resource.update( measurement_params )
        format.html { redirect_to @resource, notice: 'Measurement successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurements/1
  # DELETE /measurements/1.json
  def destroy
    @measurement.destroy
    respond_to do |format|
      format.html { redirect_to measurements_url, notice: 'Measurement was successfully destroyed.' }
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
    @resource = Measurement.find( params[:id] )
  end
  def initialize_new_resource
    @resource = @parent.measurements.new
  end
  def initialize_resource_collection
    @resources = @parent.measurements.all.order( :priority )
    @measurements = @resources
  end
  def create_new_resource
    @resource = @parent.measurements.new( measurement_params )
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def measurement_params
    params.require(:measurement).permit(
        :process_owner_id,
        :date_lookup_id,
        :metric_id,
        :person_id,
        :value,
        :active
    )
  end

end
