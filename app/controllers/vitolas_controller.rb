class VitolasController < ApplicationController
  before_action :set_vitola, only: [:show, :edit, :update, :destroy]

  # GET /vitolas
  # GET /vitolas.json
  def index
    @vitolas = Vitola.all
  end

  # GET /vitolas/1
  # GET /vitolas/1.json
  def show
  end

  # GET /vitolas/new
  def new
    @vitola = Vitola.new
  end

  # GET /vitolas/1/edit
  def edit
  end

  # POST /vitolas
  # POST /vitolas.json
  def create
    @vitola = Vitola.new(vitola_params)

    respond_to do |format|
      if @vitola.save
        format.html { redirect_to @vitola, notice: 'Vitola was successfully created.' }
        format.json { render :show, status: :created, location: @vitola }
      else
        format.html { render :new }
        format.json { render json: @vitola.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vitolas/1
  # PATCH/PUT /vitolas/1.json
  def update
    respond_to do |format|
      if @vitola.update(vitola_params)
        format.html { redirect_to @vitola, notice: 'Vitola was successfully updated.' }
        format.json { render :show, status: :ok, location: @vitola }
      else
        format.html { render :edit }
        format.json { render json: @vitola.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vitolas/1
  # DELETE /vitolas/1.json
  def destroy
    @vitola.destroy
    respond_to do |format|
      format.html { redirect_to vitolas_url, notice: 'Vitola was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vitola
      @vitola = Vitola.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vitola_params
      params.require(:vitola).permit(:marca, :vitola, :length, :rg, :releaseType, :year, :region)
    end
end
