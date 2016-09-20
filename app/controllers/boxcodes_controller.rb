class BoxcodesController < ApplicationController
  def coh
    @bcodes = CohBcode.includes(:coh_price,:package, :vitola).all
  end

  def stagnetto
    @bcodes = StagBcode.includes(:stag_price,:package, :vitola).all
  end
end
