class PainPointUpdatesController < ApplicationController
  before_action :set_pain_point_update, only: [:show, :edit, :update, :destroy]

  # GET /pain_point_updates
  # GET /pain_point_updates.json
  def index
    @pain_point_updates = PainPointUpdate.all
  end

  # GET /pain_point_updates/1
  # GET /pain_point_updates/1.json
  def show
  end

  # GET /pain_point_updates/new
  def new
    @pain_point_update = PainPointUpdate.new
  end

  # GET /pain_point_updates/1/edit
  def edit
  end

  # POST /pain_point_updates
  # POST /pain_point_updates.json
  def create
    @pain_point_update = PainPointUpdate.new(pain_point_update_params)

    respond_to do |format|
      if @pain_point_update.save
        format.html { redirect_to @pain_point_update, notice: 'Pain point update was successfully created.' }
        format.json { render :show, status: :created, location: @pain_point_update }
      else
        format.html { render :new }
        format.json { render json: @pain_point_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pain_point_updates/1
  # PATCH/PUT /pain_point_updates/1.json
  def update
    respond_to do |format|
      if @pain_point_update.update(pain_point_update_params)
        format.html { redirect_to @pain_point_update, notice: 'Pain point update was successfully updated.' }
        format.json { render :show, status: :ok, location: @pain_point_update }
      else
        format.html { render :edit }
        format.json { render json: @pain_point_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pain_point_updates/1
  # DELETE /pain_point_updates/1.json
  def destroy
    @pain_point_update.destroy
    respond_to do |format|
      format.html { redirect_to pain_point_updates_url, notice: 'Pain point update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pain_point_update
      @pain_point_update = PainPointUpdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pain_point_update_params
      params.require(:pain_point_update).permit(:PainPoint_id, :progress_id_id, :progress_type, :pass_fail)
    end
end
