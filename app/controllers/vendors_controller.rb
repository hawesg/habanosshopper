class VendorsController < ApplicationController
  def coh
    @coh_prices = Package.joins(:coh_price).includes(:coh_price, :vitola).all
  end

  def ihavana
    @ih_prices = Package.joins(:ih_price).includes(:ih_price, :vitola).all
  end

  def stagnetto
    @stag_prices = Package.joins(:stag_price).includes(:stag_price, :vitola).all
  end
  
  def compare
    
  end
  def index
    @packages = Package.includes(:vitola, :coh_price, :ih_price, :stag_price).all
  end
end
