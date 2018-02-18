class PeopleController < ApplicationController

  before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy]
  before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
  before_action :initialize_new_resource, only: [:new]
  before_action :initialize_resource_collection, only: [:index]


  # GET /people.json

  # GET organizations/1/people
  def index
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET organization/1/people/new
  def new
  end
  # GET /people/1/edit
  # organizations/16/people/11/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
  #  @organization = Organization.find( organization_params[:id] )
    @resource = @parent.people.new( person_params )

    respond_to do |format|
    if @resource.save
        format.html { redirect_to organization_path( @parent ), notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
    else
    #  organization = organization.create( person_params[:organization_attributes] )
     # @person = organization.people.build( person_params )
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @resource.update( person_params )
        format.html { redirect_to organization_path( @parent ), notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @resource = @parent.people.find( params[:id])
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to organization_path( @parent ), notice: 'Person was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def set_parent_from_url
    org_id = params[:process_owner_id] || params[:customer_id] || params[:supplier_id]|| params[:organization_id]
    @parent = Organization.find_by_id( org_id )
  end
  def initialize_resource
    @resource = Person.find( params[:id] )
  end
  def initialize_new_resource
    @resource = @parent.people.new
  end
  def initialize_resource_collection
    @resources = @parent.users.all
  end


  # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(
        :first_name,
        :last_name,
        :telephone,
        :organization_id,
        :job_title,
        :organization_name
      )
    end




end
