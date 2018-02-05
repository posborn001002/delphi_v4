class ActionResultsController < ApplicationController
  before_action :set_action_result, only: [:show, :edit, :update, :destroy]

  # GET /action_results
  # GET /action_results.json
  def index
    @action_results = ActionResult.all
  end

  # GET /action_results/1
  # GET /action_results/1.json
  def show
  end

  # GET /action_results/new
  def new
    @action_result = ActionResult.new
  end

  # GET /action_results/1/edit
  def edit
  end

  # POST /action_results
  # POST /action_results.json
  def create
    @action_result = ActionResult.new( action_result_params )

    respond_to do |format|
      if @action_result.save
        format.html { redirect_to @action_result, notice: 'Action result was successfully created.' }
        format.json { render :show, status: :created, location: @action_result }
      else
        format.html { render :new }
        format.json { render json: @action_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /action_results/1
  # PATCH/PUT /action_results/1.json
  def update
    respond_to do |format|
      if @action_result.update(action_result_params)
        format.html { redirect_to @action_result, notice: 'Action result was successfully updated.' }
        format.json { render :show, status: :ok, location: @action_result }
      else
        format.html { render :edit }
        format.json { render json: @action_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_results/1
  # DELETE /action_results/1.json
  def destroy
    @action_result.destroy
    respond_to do |format|
      format.html { redirect_to action_results_url, notice: 'Action result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_result
      @action_result = ActionResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_result_params
      params.require(:action_result).permit(:organization_id, :ar_number, :action, :result)
    end
end
