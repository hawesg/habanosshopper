class StagBcodesController < ApplicationController
  before_action :set_stag_bcode, only: [:show, :edit, :update, :destroy]

  # GET /stag_bcodes
  # GET /stag_bcodes.json
  def index
    @stag_bcodes = StagBcode.all
  end

  # GET /stag_bcodes/1
  # GET /stag_bcodes/1.json
  def show
  end

  # GET /stag_bcodes/new
  def new
    @stag_bcode = StagBcode.new
  end

  # GET /stag_bcodes/1/edit
  def edit
  end

  # POST /stag_bcodes
  # POST /stag_bcodes.json
  def create
    @stag_bcode = StagBcode.new(stag_bcode_params)

    respond_to do |format|
      if @stag_bcode.save
        format.html { redirect_to @stag_bcode, notice: 'Stag bcode was successfully created.' }
        format.json { render :show, status: :created, location: @stag_bcode }
      else
        format.html { render :new }
        format.json { render json: @stag_bcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stag_bcodes/1
  # PATCH/PUT /stag_bcodes/1.json
  def update
    respond_to do |format|
      if @stag_bcode.update(stag_bcode_params)
        format.html { redirect_to @stag_bcode, notice: 'Stag bcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @stag_bcode }
      else
        format.html { render :edit }
        format.json { render json: @stag_bcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stag_bcodes/1
  # DELETE /stag_bcodes/1.json
  def destroy
    @stag_bcode.destroy
    respond_to do |format|
      format.html { redirect_to stag_bcodes_url, notice: 'Stag bcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stag_bcode
      @stag_bcode = StagBcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stag_bcode_params
      params.require(:stag_bcode).permit(:stagID, :name, :bcode, :stag_price_id)
    end
end
