class ToeTagsController < ApplicationController

  before_action :set_parent_from_url, only: [:index, :new, :show, :update, :destroy, :create]
  before_action :set_edit_parent_from_url, only: [:new,  :edit]
  before_action :initialize_resource, only: [:show, :update, :destroy, :edit]
  before_action :initialize_new_resource, only: [:new]
  before_action :create_new_resource, only: [:create]
  before_action :initialize_resource_collection, only: [:index]

  # GET /toe_tags
  # GET /toe_tags.json
  def index
  end

  # GET /toe_tags/1
  # GET /toe_tags/1.json
  def show
  end

  # GET /toe_tags/new
  def new
  end

  # GET /toe_tags/1/edit
  def edit
  end

  # POST /toe_tags
  # POST /toe_tags.json
  def create

    respond_to do |format|
      if @resource.save
        format.html { redirect_to workshop_path( @parent ), notice: 'Toe Tag successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, notice: 'An error occured!'  }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /toe_tags/1
  # PATCH/PUT /toe_tags/1.json
  def update
    respond_to do |format|
      if @resource.update( toe_tag_params )
        format.html { redirect_to @resource, notice: 'Toe Tag successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toe_tags/1
  # DELETE /toe_tags/1.json
  def destroy
    @toe_tag.destroy
    respond_to do |format|
      format.html { redirect_to toe_tags_url, notice: 'Toe tag was successfully destroyed.' }
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
      @resource = ToeTag.find( params[:id] )
    end
    def initialize_new_resource
      @resource = @parent.toe_tags.new
    end
    def initialize_resource_collection
      @resources = @parent.toe_tags.all.order( :priority )
      @toe_tags = @resources
    end
    def create_new_resource
      @resource = @parent.toe_tags.new( toe_tag_params )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def toe_tag_params
      params.require(:toe_tag).permit(
          :priority,
          :big_small_now,
          :solution,
          :success_measurement
      )
    end

end
