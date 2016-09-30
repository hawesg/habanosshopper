class IhPrice < ApplicationRecord
  #belongs_to :package
  def cost_per_cigar
    (usd/self.package.total_count).round(2)
  end
  def usd
    price.round(2)
  end
end
