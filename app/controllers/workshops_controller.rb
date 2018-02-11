class WorkshopsController < ApplicationController

  before_action :set_organization, only: [:index, :new]
  before_action :set_workshop_and_organization, only: [:show, :update, :destroy]
  before_action :set_workshop, only: [:edit]

  # GET /workshops
  # GET /workshops.json
  def index
    @workshops = Workshop.all
  end

  # GET /workshops/1
  # GET /workshops/1.json
  def show
  end

  # GET /workshops/new
  def new
    @workshop = @organization.workshops.new
  end

  # GET /workshops/1/edit
  def edit
  end

  # POST /workshops
  # POST /workshops.json
  def create
    @organization = Organization.find( organization_params[:id] )
    @workshop = @organization.workshops.new( workshop_params )

    respond_to do |format|
      if @workshop.save
        format.html { redirect_to organization_path( @organization ), notice: 'Workshop was successfully created.' }
        format.json { render :show, status: :created, location: @workshop }
      else
        format.html { render :new }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /workshops/1
  # PATCH/PUT /workshops/1.json
  def update
    respond_to do |format|
      if @workshop.update(workshop_params)
        format.html { redirect_to organization_path( @organization ), notice: 'Workshop was successfully updated.' }
        format.json { render :show, status: :ok, location: @workshop }
      else
        format.html { render :edit }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshops/1
  # DELETE /workshops/1.json
  def destroy
    @workshop.destroy
    respond_to do |format|
      format.html { redirect_to workshops_url, notice: 'Workshop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop
      @workshop = Workshop.find(params[:id])
      @org_id = @workshop.organization_id
    end
  def set_organization
    @organization = Organization.find( params[:organization_id] )
    @org_id = @organization.id
  end
  def set_workshop_and_organization
    set_workshop()
    @organization = Organization.find( @workshop.organization_id )
  end
  def set_org_id
    @org_id =  params[:organization_id] || organization_params[:id]
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workshop_params
      params.require(:workshop).permit(:date_lookup_id, :capability_goal, :process_name, :process_description, :left_boundary, :right_boundary, :organization_id)
    end
    def organization_params
      params.require( :organization).permit(:id );
    end

end
