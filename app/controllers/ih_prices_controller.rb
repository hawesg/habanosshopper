class IhPricesController < ApplicationController
  before_action :set_ih_price, only: [:show, :edit, :update, :destroy]

  # GET /ih_prices
  # GET /ih_prices.json
  def index
    @ih_prices = IhPrice.all
  end

  # GET /ih_prices/1
  # GET /ih_prices/1.json
  def show
  end

  # GET /ih_prices/new
  def new
    @ih_price = IhPrice.new
  end

  # GET /ih_prices/1/edit
  def edit
  end

  # POST /ih_prices
  # POST /ih_prices.json
  def create
    @ih_price = IhPrice.new(ih_price_params)

    respond_to do |format|
      if @ih_price.save
        format.html { redirect_to @ih_price, notice: 'Ih price was successfully created.' }
        format.json { render :show, status: :created, location: @ih_price }
      else
        format.html { render :new }
        format.json { render json: @ih_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ih_prices/1
  # PATCH/PUT /ih_prices/1.json
  def update
    respond_to do |format|
      if @ih_price.update(ih_price_params)
        format.html { redirect_to @ih_price, notice: 'Ih price was successfully updated.' }
        format.json { render :show, status: :ok, location: @ih_price }
      else
        format.html { render :edit }
        format.json { render json: @ih_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ih_prices/1
  # DELETE /ih_prices/1.json
  def destroy
    @ih_price.destroy
    respond_to do |format|
      format.html { redirect_to ih_prices_url, notice: 'Ih price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ih_price
      @ih_price = IhPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ih_price_params
      params.require(:ih_price).permit(:name, :price, :package_id)
    end
end
