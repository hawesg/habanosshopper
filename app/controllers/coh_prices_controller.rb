class CohPricesController < ApplicationController
  before_action :set_coh_price, only: [:show, :edit, :update, :destroy]

  # GET /coh_prices
  # GET /coh_prices.json
  def index
    @coh_prices = CohPrice.all
  end

  # GET /coh_prices/1
  # GET /coh_prices/1.json
  def show
  end

  # GET /coh_prices/new
  def new
    @coh_price = CohPrice.new
  end

  # GET /coh_prices/1/edit
  def edit
  end

  # POST /coh_prices
  # POST /coh_prices.json
  def create
    @coh_price = CohPrice.new(coh_price_params)

    respond_to do |format|
      if @coh_price.save
        format.html { redirect_to @coh_price, notice: 'Coh price was successfully created.' }
        format.json { render :show, status: :created, location: @coh_price }
      else
        format.html { render :new }
        format.json { render json: @coh_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coh_prices/1
  # PATCH/PUT /coh_prices/1.json
  def update
    respond_to do |format|
      if @coh_price.update(coh_price_params)
        format.html { redirect_to @coh_price, notice: 'Coh price was successfully updated.' }
        format.json { render :show, status: :ok, location: @coh_price }
      else
        format.html { render :edit }
        format.json { render json: @coh_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coh_prices/1
  # DELETE /coh_prices/1.json
  def destroy
    @coh_price.destroy
    respond_to do |format|
      format.html { redirect_to coh_prices_url, notice: 'Coh price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coh_price
      @coh_price = CohPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coh_price_params
      params.require(:coh_price).permit(:name, :price, :package_id)
    end
end
