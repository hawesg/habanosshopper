class PricesController < ApplicationController
  def coh
    @prices = Package.joins(:prices).where("prices.type = ?", "CigarsOfHabanosPrice").preload(:vitola).references(:vitola)
  end

  def ihavana
    @prices = Package.joins(:prices).where("prices.type = ?", "IHavanasPrice").preload(:vitola).references(:vitola)
  end

  def stagnetto
    @prices = Package.joins(:prices).where("prices.type = ?", "LewisStagnettoPrice").preload(:vitola).references(:vitola)
  end


  def index
    @prices = Package.availible.includes(:prices, :vitola).all
  end
end
