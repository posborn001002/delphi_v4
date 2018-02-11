class PeopleController < ApplicationController
  include InitializeOrganization

  before_action :set_organization, only: [:index, :new]
  before_action :set_person_and_organization, only: [:show, :update, :destroy]
  before_action :set_person, only: [:edit]


  # GET /people.json

  # GET organizations/1/people
  def index
    @people = @organization.people.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET organization/1/people/new
  def new
    @person = @organization.people.new
  end
  # GET /people/1/edit
  # organizations/16/people/11/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @organization = Organization.find( organization_params[:id] )
    @person = @organization.people.new( person_params )

    respond_to do |format|
    if @person.save
        format.html { redirect_to organization_path( @organization ), notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
    else
    #  organization = Organization.create( person_params[:organization_attributes] )
     # @person = organization.people.build( person_params )
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update( person_params )
        format.html { redirect_to organization_path( @organization ), notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = @organization.people.find( params[:id])
    @person.destroy
    respond_to do |format|
      format.html { redirect_to organization_path( @organization ), notice: 'Person was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  #  Ser person applies to everthing except 'new'
  # Set organization should not be done for 'edit' because routing is not set up (shallow) f
  # params[:organization_id] || organization_params[:id] || @person.organization_id
  # params[:organization_is] is set when we come here from an organization
  # organization_params is set after editing
  # if jsut coming here from a person, then @person.organization_id is set.
    def set_person
      @person = Person.find( params[:id] )
      @org_id = @person.organization_id
    end
    def set_organization
      @organization = Organization.find( params[:organization_id] )
      @org_id = @organization.id
    end
    def set_person_and_organization
      set_person()
      @organization = Organization.find( @person.organization_id )
    end
    def set_org_id
      @org_id =  params[:organization_id] || organization_params[:id]
    end


  # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :email, :telephone, :organization_id, :job_title, :person, :organization_name,
                                      organizations_attributes: [:name, :address1, :address2, :city, :state, :country, :city_and_state, :latitude, :longitude ]
      )
    end

  def organization_params
    params.require(:organization).permit(:id );
  end

end
