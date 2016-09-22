class PricesController < ApplicationController
  def coh
    @prices = Package.joins(:cigars_of_habanos_price).includes(:cigars_of_habanos_price, :vitola).all
  end

  def ihavana
    @prices = Package.joins(:i_havanas_price).includes(:i_havanas_price, :vitola).all
  end

  def stagnetto
    @prices = Package.joins(:lewis_stagnetto_price).includes(:lewis_stagnetto_price, :vitola).all
  end

  def index
    @prices = Package.includes(:lewis_stagnetto_price, :cigars_of_habanos_price, :i_havanas_price, :vitola, :price).all
  end
end
