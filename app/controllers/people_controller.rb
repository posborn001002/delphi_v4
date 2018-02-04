class PeopleController < ApplicationController
  before_action :load_organization, only: [:show, :edit, :destroy, :index, :new]
  before_action :load_organization_update, only: [:update]
  before_action :set_person, only: [:show, :edit, :update, :destroy]


  # GET /people
  # GET /people.json

  def index
  #  @people = Person.all
    @people = @organization.people.all
   # format.json { head :no_content}
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = @organization.people.find( params[:id])
  end

  # GET /people/new
  def new
    @person = @organization.people.new
  end

  def newcontact
    @organization = Organization.new
    @person = @organization.people.new
  end

  def createcontact
    @organization = Organization.find_or_create_by ( { name: params[:organization_name] } )
    @person = @organization.people.create ( person_params )
    respond_to do |format|
      if @person.save
        format.html { redirect_to organization_path( @organization ), notice: 'Person was successfully created.' }
        format.json { head :no_content }
      else
        format.html { redirect_to organization_path( @organization ), notice: 'Person was not created.' }
      end
    end
  end

  # GET /people/1/edit
  # organizations/16/people/11/edit
  def edit
    @person = @organization.people.find( params[:id])
  end

  # POST /people
  # POST /people.json
  def create
   # organization = Organization.build( person_params[:organization_attributes] )
    @person = Person.new( person_params )
   #
  # @person = @organization.people.new( person_params )

    respond_to do |format|
    if @person.save
        format.html { redirect_to [@organization, @person], notice: 'Person was successfully created.' }
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

   # @person = @organization.people.find( params[:id])

    respond_to do |format|
      if @person.update( person_params )
        format.html { redirect_to [@organization, @person], notice: 'Person was successfully updated.' }
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
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :email, :telephone, :organization_id, :job_title, :person, :organization_name,
                                      organizations_attributes: [:name, :address1, :address2, :city, :state, :country, :city_and_state, :latitude, :longitude ]
      )
    end

  def load_organization
    @organization = Organization.find( params[:organization_id] )
  end

  def load_organization_update
    @organization = Organization.find( params[:person][:organization_id] )
  end

end
