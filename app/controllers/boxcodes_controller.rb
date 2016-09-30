class BoxcodesController < ApplicationController
  def cigarsofhabanos
    @bcodes = Boxcodes::CigarsOfHabanos.joins(:prices).where("prices.type = ?", "CigarsOfHabanosPrice").includes(:prices, :package, :vitola).all
    #@prices = Package..preload(:vitola).references(:vitola)
    #CohBcode.includes(:coh_price,:package, :vitola).all
  end

  def lewisstagnetto
    @bcodes = Boxcodes::LewisStagnetto.joins(:prices).where("prices.type = ?", "LewisStagnettoPrice").eager_load(:prices, :package, :vitola).references(:prices, :package, :vitola).all
  end
end
