class StagPricesController < ApplicationController
  before_action :set_stag_price, only: [:show, :edit, :update, :destroy]

  # GET /stag_prices
  # GET /stag_prices.json
  def index
    @stag_prices = StagPrice.all
  end

  # GET /stag_prices/1
  # GET /stag_prices/1.json
  def show
  end

  # GET /stag_prices/new
  def new
    @stag_price = StagPrice.new
  end

  # GET /stag_prices/1/edit
  def edit
  end

  # POST /stag_prices
  # POST /stag_prices.json
  def create
    @stag_price = StagPrice.new(stag_price_params)

    respond_to do |format|
      if @stag_price.save
        format.html { redirect_to @stag_price, notice: 'Stag price was successfully created.' }
        format.json { render :show, status: :created, location: @stag_price }
      else
        format.html { render :new }
        format.json { render json: @stag_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stag_prices/1
  # PATCH/PUT /stag_prices/1.json
  def update
    respond_to do |format|
      if @stag_price.update(stag_price_params)
        format.html { redirect_to @stag_price, notice: 'Stag price was successfully updated.' }
        format.json { render :show, status: :ok, location: @stag_price }
      else
        format.html { render :edit }
        format.json { render json: @stag_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stag_prices/1
  # DELETE /stag_prices/1.json
  def destroy
    @stag_price.destroy
    respond_to do |format|
      format.html { redirect_to stag_prices_url, notice: 'Stag price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stag_price
      @stag_price = StagPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stag_price_params
      params.require(:stag_price).permit(:name, :price, :stagID, :package_id)
    end
end
