class WorkshopsController < ApplicationController

  before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy, :create]
  before_action :set_edit_parent_from_url, only: [:new,  :edit]
  before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
  before_action :initialize_new_resource, only: [:new]
  before_action :create_new_resource, only: [:create]
  before_action :initialize_resource_collection, only: [:index]

  # GET /workshops
  # GET /workshops.json
  def index
  end

  # GET /workshops/1
  # GET /workshops/1.json
  def show
    @toe_tags = @resource.toe_tags.all
    @action_results = @resource.action_results.all
    @pain_points = @resource.pain_points.all
    @participants = @resource.people.all
  end

  # GET /workshops/new
  def new
  end

  # GET /workshops/1/edit
  def edit
  end

  # POST /workshops
  # POST /workshops.json
  def create
    respond_to do |format|
      if @resource.save
        format.html { redirect_to process_owner_path( @parent ), notice: 'Workshop was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /workshops/1
  # PATCH/PUT /workshops/1.json
  def update
    respond_to do |format|
      if @resource.update(workshop_params)
        format.html { redirect_to workshop_path( @resource ), notice: 'Workshop was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        set_edit_parent_from_url()
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshops/1
  # DELETE /workshops/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to workshops_url, notice: 'Workshop was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def set_parent_from_url
      # We set a default parent to this orgnaziation on the ApplicationCOontroller
      # @parent = ProcessOwner.find( params[:process_owner_id] || params[:process_owner][:id] )
    end
    def set_edit_parent_from_url

      # @edit_parent = ProcessOwner.find( params[:process_owner_id] )
    end
    def initialize_resource
      @resource = Workshop.find( params[:id] )
    end
    def initialize_new_resource
      @resource = @parent.workshops.new
    end
    def initialize_resource_collection
      @resources = @parent.workshops.all
    end
    def create_new_resource
      @resource = @parent.workshops.new( workshop_params )
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def workshop_params
      params.require(:workshop).permit(
          :date_lookup_id,
          :date,
          :process_owner_id,
          :capability_goal,
          :process_name,
          :process_description,
          :left_boundary,
          :right_boundary,
          :active
      )
    end

    def process_owner_params
      params.require(:process_owner).permit(
          :id
      );
    end

end
