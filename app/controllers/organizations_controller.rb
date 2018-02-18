class OrganizationsController < ApplicationController

  before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
  before_action :initialize_new_resource, only: [:new]
  before_action :initialize_resource_collection, only: [:index]


   # before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy, :create]
   # before_action :set_edit_parent_from_url, only: [:new,  :edit]
   # before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
   # before_action :initialize_new_resource, only: [:new]
   # before_action :create_new_resource, only: [:create]
   # before_action :initialize_resource_collection, only: [:index]


  # GET /Organizations
  # GET /Organizations.json
  def index
  end

  # GET /Organizations/1
  # GET /Organizations/1.json
  def show
  end

  # GET /Organizations/new
  def new
  end

  # GET /Organizations/1/edit
  def edit
  end

  # POST /Organizations
  # POST /Organizations.json
  def create
    @resource = Organization.create( permitted_params )

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Organizations/1
  # PATCH/PUT /Organizations/1.json
  def update
    respond_to do |format|
      if @resource.update( permitted_params )
        format.html { redirect_to @resource, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Organizations/1
  # DELETE /Organizations/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def initialize_resource
    @resource = Organization.find( params[:id] )
  end
  def initialize_new_resource
    @resource = Organization.new
  end
  def initialize_resource_collection
    @resources = Organization.all
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permitted_params
      params.require(:organization).permit(
        :name,
        :address1,
        :address2,
        :city,
        :state,
        :country,
        :city_and_state,
        :latitude,
        :longitude,
        people_attributes: [
          :first_name,
          :last_name,
          :telephone,
          :job_title
          ],
        user_attributes: [
          :email,
          :password
      ]
      )
    end
end
