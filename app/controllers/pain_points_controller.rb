class PainPointsController < ApplicationController
  before_action :set_pain_point, only: [:show, :edit, :update, :destroy]

  # GET /pain_points
  # GET /pain_points.json
  def index
    @pain_points = PainPoint.all
  end

  # GET /pain_points/1
  # GET /pain_points/1.json
  def show
  end

  # GET /pain_points/new
  def new
    @pain_point = PainPoint.new
  end

  # GET /pain_points/1/edit
  def edit
  end

  # POST /pain_points
  # POST /pain_points.json
  def create
    @pain_point = PainPoint.new(pain_point_params)

    respond_to do |format|
      if @pain_point.save
        format.html { redirect_to @pain_point, notice: 'Pain point was successfully created.' }
        format.json { render :show, status: :created, location: @pain_point }
      else
        format.html { render :new }
        format.json { render json: @pain_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pain_points/1
  # PATCH/PUT /pain_points/1.json
  def update
    respond_to do |format|
      if @pain_point.update(pain_point_params)
        format.html { redirect_to @pain_point, notice: 'Pain point was successfully updated.' }
        format.json { render :show, status: :ok, location: @pain_point }
      else
        format.html { render :edit }
        format.json { render json: @pain_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pain_points/1
  # DELETE /pain_points/1.json
  def destroy
    @pain_point.destroy
    respond_to do |format|
      format.html { redirect_to pain_points_url, notice: 'Pain point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pain_point
      @pain_point = PainPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pain_point_params
      params.require(:pain_point).permit(:workshop_id, :description)
    end
end
