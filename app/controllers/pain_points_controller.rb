class PainPointsController < ApplicationController

  before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy, :create]
  before_action :set_edit_parent_from_url, only: [:new,  :edit]
  before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
  before_action :initialize_new_resource, only: [:new]
  before_action :create_new_resource, only: [:create]
  before_action :initialize_resource_collection, only: [:index]

  # GET /pain_points
  # GET /pain_points.json
  def index
  end

  # GET /pain_points/1
  # GET /pain_points/1.json
  def show
  end

  # GET /pain_points/new
  def new
  end

  # GET /pain_points/1/edit
  def edit
  end

  # POST /pain_points
  # POST /pain_points.json
  def create

    respond_to do |format|
      if @resource.save
        format.html { redirect_to action_result_path( @parent ), notice: 'Pain Point successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, notice: 'An error occured!'  }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pain_points/1
  # PATCH/PUT /pain_points/1.json
  def update
    respond_to do |format|
      if @resource.update( pain_point_params )
        format.html { redirect_to @resource, notice: 'Pain Point successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pain_points/1
  # DELETE /pain_points/1.json
  def destroy
    @pain_point.destroy
    respond_to do |format|
      format.html { redirect_to pain_points_url, notice: 'Pain Point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_parent_from_url
    @parent = ActionResult.find( params[:action_result_id] || params[:action_result][:id] )
  end
  def set_edit_parent_from_url
    @edit_parent = action_result.find( params[:action_result_id] )
  end
  def initialize_resource
    @resource = PainPoint.find( params[:id] )
  end
  def initialize_new_resource
    @resource = @parent.pain_points.new
  end
  def initialize_resource_collection
    @resources = @parent.pain_points.all.order
    @pain_points = @resources
  end
  def create_new_resource
    @resource = @parent.pain_points.new( pain_point_params )
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pain_point_params
    params.require(:pain_point).permit(
        :symptom,
        :impact
    )
  end

end
