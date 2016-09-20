class CohBcodesController < ApplicationController
  before_action :set_coh_bcode, only: [:show, :edit, :update, :destroy]

  # GET /coh_bcodes
  # GET /coh_bcodes.json
  def index
    @coh_bcodes = CohBcode.all
  end

  # GET /coh_bcodes/1
  # GET /coh_bcodes/1.json
  def show
  end

  # GET /coh_bcodes/new
  def new
    @coh_bcode = CohBcode.new
  end

  # GET /coh_bcodes/1/edit
  def edit
  end

  # POST /coh_bcodes
  # POST /coh_bcodes.json
  def create
    @coh_bcode = CohBcode.new(coh_bcode_params)

    respond_to do |format|
      if @coh_bcode.save
        format.html { redirect_to @coh_bcode, notice: 'Coh bcode was successfully created.' }
        format.json { render :show, status: :created, location: @coh_bcode }
      else
        format.html { render :new }
        format.json { render json: @coh_bcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coh_bcodes/1
  # PATCH/PUT /coh_bcodes/1.json
  def update
    respond_to do |format|
      if @coh_bcode.update(coh_bcode_params)
        format.html { redirect_to @coh_bcode, notice: 'Coh bcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @coh_bcode }
      else
        format.html { render :edit }
        format.json { render json: @coh_bcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coh_bcodes/1
  # DELETE /coh_bcodes/1.json
  def destroy
    @coh_bcode.destroy
    respond_to do |format|
      format.html { redirect_to coh_bcodes_url, notice: 'Coh bcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coh_bcode
      @coh_bcode = CohBcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coh_bcode_params
      params.require(:coh_bcode).permit(:name, :bcode, :coh_price_id)
    end
end
