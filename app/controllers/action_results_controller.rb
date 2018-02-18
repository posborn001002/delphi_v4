class ActionResultsController < ApplicationController

  before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy, :create]
  before_action :set_edit_parent_from_url, only: [:new,  :edit]
  before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
  before_action :initialize_new_resource, only: [:new]
  before_action :create_new_resource, only: [:create]
  before_action :initialize_resource_collection, only: [:index]

  # GET /action_results
  # GET /action_results.json
  def index
  end

  # GET /action_results/1
  # GET /action_results/1.json
  def show
  end

  # GET /action_results/new
  def new
  end

  # GET /action_results/1/edit
  def edit
  end

  # POST /action_results
  # POST /action_results.json
  def create
    respond_to do |format|
      if @resource.save
        format.html { redirect_to workshop_path( @parent ), notice: 'Action Result successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, notice: 'An error occured!'  }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /action_results/1
  # PATCH/PUT /action_results/1.json
  def update
    respond_to do |format|
      if @resource.update( action_result_params )
        format.html { redirect_to @resource, notice: 'Action Result successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_results/1
  # DELETE /action_results/1.json
  def destroy
    @action_result.destroy
    respond_to do |format|
      format.html { redirect_to action_results_url, notice: 'Action Result was successfully destroyed.' }
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
    @resource = ActionResult.find( params[:id] )
  end
  def initialize_new_resource
    @resource = @parent.action_results.new
  end
  def initialize_resource_collection
    @resources = @parent.action_results.all.order( :priority )
    @action_results = @resources
  end
  def create_new_resource
    @resource = @parent.action_results.new( action_result_params )
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def action_result_params
    params.require(:action_result).permit(
        :workshop_id,
        :ar_number,
        :action,
        :result,
        :active
    )
  end

end
