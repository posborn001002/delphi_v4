class ToeTagsController < ApplicationController
  before_action :set_toe_tag, only: [:show, :edit, :update, :destroy]

  # GET /toe_tags
  # GET /toe_tags.json
  def index
    @toe_tags = ToeTag.all
  end

  # GET /toe_tags/1
  # GET /toe_tags/1.json
  def show
  end

  # GET /toe_tags/new
  def new
    @toe_tag = ToeTag.new
  end

  # GET /toe_tags/1/edit
  def edit
  end

  # POST /toe_tags
  # POST /toe_tags.json
  def create
    @toe_tag = ToeTag.new(toe_tag_params)

    respond_to do |format|
      if @toe_tag.save
        format.html { redirect_to @toe_tag, notice: 'Toe tag was successfully created.' }
        format.json { render :show, status: :created, location: @toe_tag }
      else
        format.html { render :new }
        format.json { render json: @toe_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /toe_tags/1
  # PATCH/PUT /toe_tags/1.json
  def update
    respond_to do |format|
      if @toe_tag.update(toe_tag_params)
        format.html { redirect_to @toe_tag, notice: 'Toe tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @toe_tag }
      else
        format.html { render :edit }
        format.json { render json: @toe_tag.errors, status: :unprocessable_entity }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_toe_tag
      @toe_tag = ToeTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def toe_tag_params
      params.require(:toe_tag).permit(:priority, :big_small_now, :solution, :success_measurement)
    end
end
